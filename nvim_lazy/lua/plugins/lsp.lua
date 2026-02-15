return {

  { "hrsh7th/nvim-cmp" },      -- Autocompletion
  { "hrsh7th/cmp-nvim-lsp" },  -- LSP completion source

  {
    "neovim/nvim-lspconfig",   -- Server definitions only (no setup framework)
    config = function()

      local util = require("lspconfig.util")

      -- ========================
      -- clangd
      -- ========================
      vim.lsp.config("clangd", {
        cmd = { "clangd", "--clang-tidy", "--completion-style=detailed", "--header-insertion=iwyu" },
        filetypes = { "cpp", "c", "h" },
      })
      vim.lsp.enable("clangd")

      -- ========================
      -- qmlls
      -- ========================
      vim.lsp.config("qmlls", {
        cmd = { "qmlls" },
        filetypes = { "qml", "qmljs" },
        root_dir = function(fname)
          local git_root = util.root_pattern(".git")(fname)
          local cmake_root = util.root_pattern("CMakeLists.txt")(fname)
          return git_root or cmake_root
        end,
        single_file_support = true,
      })
      vim.lsp.enable("qmlls")

      -- ========================
      -- cmake
      -- ========================
      vim.lsp.config("cmake", {
        cmd = { "cmake-language-server" },
        filetypes = { "cmake" },
        root_dir = util.root_pattern("CMakeLists.txt", ".git"),
      })
      vim.lsp.enable("cmake")

      -- ========================
      -- zls
      -- ========================
      vim.lsp.config("zls", {
        cmd = { "zls" },
        filetypes = { "zig" },
        root_dir = util.root_pattern("build.zig", ".git"),
        single_file_support = true,
      })
      vim.lsp.enable("zls")

      -- ========================
      -- Keymaps & Utilities
      -- ========================

      -- Toggle LSP Warnings
      vim.keymap.set("n", "<leader>tw", function()
        local current = vim.diagnostic.config().virtual_text
        vim.diagnostic.config({
          virtual_text = not current,
        })
      end, { desc = "Toggle LSP Warnings" })

      -- LSP completion (omnifunc)
      vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", { silent = true })

      -- Switch source/header (clangd)
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

      -- Code actions
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
      vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "LSP Rename Symbol" })
      vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "LSP Format Buffer" })

    end,
  }
}
