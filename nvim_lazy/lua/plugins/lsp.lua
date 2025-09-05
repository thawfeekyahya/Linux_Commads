return {
   
   {"hrsh7th/nvim-cmp" },      -- Autocompletion,
   {"hrsh7th/cmp-nvim-lsp"},   -- LSP completion source,

   {
     "neovim/nvim-lspconfig",   -- Base LSP support,
     config = function()

       local lspconfig = require("lspconfig")
       local util = require('lspconfig.util')
       
       lspconfig.clangd.setup({ 
               cmd = { "clangd", "--clang-tidy", "--completion-style=detailed", "--header-insertion=iwyu" },
               filetypes = { "cpp", "c", "h" } 
       })
       
       lspconfig.qmlls.setup({
          cmd = { "qmlls" },  -- Ensure `qmlls` is in your system PATH
          filetypes = { "qml", "qmljs" },
          root_dir = function(fname)
            local git_root = util.root_pattern(".git")(fname)
            local cmake_root = util.root_pattern("CMakeLists.txt")(fname)
            return git_root or cmake_root  -- Prefer `.git`, fallback to `CMakeLists.txt`
          end,
          single_file_support = true,
       })

       lspconfig.cmake.setup({
         cmd = { "cmake-language-server" },
         filetypes = { "cmake" },
         root_dir = require("lspconfig.util").root_pattern("CMakeLists.txt", ".git"),
       })
       
       lspconfig.zls.setup({
         cmd = { "zls" },
         filetypes = { "zig" },
         root_dir = require("lspconfig.util").root_pattern("build.zig", ".git"),
         single_file_support = true,
       })

       -- Toggle LSP Warnings
       vim.keymap.set("n", "<leader>tw", function()
         local current = vim.diagnostic.config().virtual_text
         vim.diagnostic.config({
           virtual_text = not current,
         })
       end, { desc = "Toggle LSP Warnings" })
       
       -- LSP Powered Code Completion
       vim.api.nvim_set_keymap("i", "<C-Space>", "<C-x><C-o>", { noremap = true, silent = true })
       
       -- switch source / header
       vim.keymap.set("n", "<leader>sw", function()
         local params = { uri = vim.uri_from_bufnr(0) }
         vim.lsp.buf_request(0, "textDocument/switchSourceHeader", params, function(_, result)
           if result then
             vim.cmd("edit " .. vim.uri_to_fname(result))
           else
             print("No corresponding source/header file found!")
           end
         end)
       end, { desc = "Switch between source and header" })

      -- auto fix header include
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
    end,
  }
}

