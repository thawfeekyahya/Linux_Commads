--Default Theme
vim.cmd("colorscheme rose-pine-main") 

--Re-maps
vim.g.mapleader = ' ' -- Map leader key to space

-- Enable window numbering in status line
vim.o.winbar = "%=%{winnr()} %f"

vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })

-- Paste without overwriting clipboard in Visual mode
vim.api.nvim_set_keymap("x", "<leader>p", '"_dP', { noremap = true, silent = true })

-- Telescope Key mappings
vim.keymap.set('n', '<Leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Find files' })
vim.keymap.set('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'Find Buffers' })
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>', { desc = 'Find Recent Files' })
vim.keymap.set("n", "<leader>gl", ":Telescope git_bcommits<CR>", { desc = "View Git Log for Current File" })
vim.keymap.set('n', '<leader>fs', ':Telescope lsp_document_symbols<CR>', { desc = "Search Symbols" })

-- yank current file path / name
vim.keymap.set('n', '<leader>yp', ':let @+ = expand("%:p")<CR>', { desc = "Copy file path" })
vim.keymap.set('n', '<leader>yn', ':let @+ = expand("%:t")<CR>', { desc = "Copy file name" })

-- yank variable under cursor to clipboard
vim.keymap.set('n', '<leader>yv', '"+yiW', { desc = "Copy variable to clipboard" })

-- Reference search
vim.keymap.set("n", "rs", require('telescope.builtin').lsp_references, { desc = "Find function references" })

-- other mappings
vim.keymap.set('n', '<Leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = "Show diagnostics" })
vim.keymap.set("n", "<leader>nh", ":nohlsearch<CR>", { noremap = true, silent = true })


-- Git shortcuts
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview Git Hunk" })
vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Git Hunk" })
vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>", { desc = "Git Diff (Current vs HEAD)" })
vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "Git Blame" })

-- Outliner short cut
vim.keymap.set('n', '<leader>to', '<cmd>AerialToggle!<CR>', {desc = "Tree outliner"})

-- Telescope marks
vim.keymap.set('n', '<leader>tm', require('telescope.builtin').marks, { desc = "Open Marks Picker" })

-- View git log
vim.keymap.set("n", "<leader>gl", function()
  require("telescope.builtin").git_bcommits()
end, { desc = "Git BCommits" })

-- switch source / header
-- switch source / header
vim.keymap.set("n", "<leader>ss", function()
  local params = { uri = vim.uri_from_bufnr(0) }
  vim.lsp.buf_request(0, "textDocument/switchSourceHeader", params, function(_, result)
    if result then
      vim.cmd("edit " .. vim.uri_to_fname(result))
    else
      print("No corresponding source/header file found!")
    end
  end)
end, { desc = "Switch between source and header" })


-- Git (LazyGit)
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "Open LazyGit" })

-- Toggle LSP Warnings
vim.keymap.set("n", "<leader>tw", function()
  local current = vim.diagnostic.config().virtual_text
  vim.diagnostic.config({
    virtual_text = not current,
  })
end, { desc = "Toggle LSP Warnings" })

-- Settings
vim.opt.tags = { "./tags", "tags" }
vim.opt.cursorline = true
vim.opt.foldcolumn = "1"
vim.opt.relativenumber = true
vim.opt.number = true
vim.cmd("filetype plugin indent on")

-- Plugin manager (vim-plug in Lua)
require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'  -- Plugin manager
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

 -- File Outline with dependencies
  use {
    'stevearc/aerial.nvim',
    opts = {},
    config = function()
      require("aerial").setup()
    end
  }

 --Rose Pine theme
  use { "rose-pine/neovim", as = "rose-pine" }

  -- Catppuccin theme
  use { "catppuccin/nvim", as = "catppuccin" }

  -- CMake Integration
  use 'Civitasv/cmake-tools.nvim'

  use { 
     "lewis6991/gitsigns.nvim",
      requires = "nvim-lua/plenary.nvim" 
  }

  -- Lazy Git
  use {
    "kdheepak/lazygit.nvim",
     requires = { "nvim-lua/plenary.nvim" }
  }

  -- Show marks
  use "kshenoy/vim-signature"


  -- Language Server Protocol (LSP)
  use "neovim/nvim-lspconfig"   -- Base LSP support
  use "hrsh7th/nvim-cmp"        -- Autocompletion
  use "hrsh7th/cmp-nvim-lsp"    -- LSP completion source

  use "mfussenegger/nvim-lint" 
  use "mfussenegger/nvim-dap"  -- Debugging support

  use {
  'nvim-tree/nvim-tree.lua',
  requires = { 'nvim-tree/nvim-web-devicons' }, -- Optional for file icons
  config = function()
    require("nvim-tree").setup()
  end
  }

  -- Treesitter for better syntax highlighting
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  -- Fuzzy Finder (Telescope)
  use {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" }
  }

  -- telescope symbol finder
  use 'nvim-telescope/telescope-symbols.nvim'

  -- Statusline
  use "nvim-lualine/lualine.nvim"

  -- QML Syntax Support
  use "peterhoeg/vim-qml"

  -- JavaScript/TypeScript Support
  use "pangloss/vim-javascript"
  use "MaxMEllon/vim-jsx-pretty"  -- JSX/TSX support

end)

-- Telescope Preview window scrolling
require('telescope').setup({
  defaults = {
    layout_strategy = "horizontal",  -- Use horizontal layout for better preview
    layout_config = {
      preview_width = 0.5,  -- Adjust preview window width
    },
    file_ignore_patterns = { "node_modules", ".git" },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
    mappings = {
      i = {
        ["<C-p>"] = require('telescope.actions.layout').toggle_preview,  -- Toggle preview manually
	      ["<C-l>"] = require('telescope.actions').preview_scrolling_right, -- Scroll right
        ["<C-h>"] = require('telescope.actions').preview_scrolling_left, -- Scroll left
      },
    },
  },
  pickers = {
    find_files = {
      previewer = true,   -- ✅ Ensure previewer is enabled
    },
    live_grep = {
      previewer = true,   -- ✅ Enable preview for live grep
    }
  }
})


-- Enable Treesitter for better syntax highlighting
require("nvim-treesitter.configs").setup {
  ensure_installed = { "cpp", "qmljs", "javascript", "typescript", "tsx", "json", "html", "css" },
  highlight = { enable = true },
}

-- Setup LSP for C++ (Qt), QML, JavaScript
local lspconfig = require("lspconfig")

-- Enable Clangd for C++ (Qt)
lspconfig.clangd.setup({
  cmd = { "clangd", "--background-index","--compile-commands-dir=build" },
  filetypes = { "cpp", "c", "objc", "objcpp", "h", "hpp" },
})

-- Enable QML LSP (qmlls)
local lspconfig = require('lspconfig')
local util = require('lspconfig.util')

lspconfig.qmlls.setup{
    cmd = (function()
        -- Find the project root
        local root_dir = util.root_pattern("CMakeLists.txt", ".git")(vim.fn.getcwd())

        -- If a project-specific qmlls.json exists, use it
        if root_dir then
            local qmlls_config = root_dir .. "/qmlls.json"
            if vim.fn.filereadable(qmlls_config) == 1 then
                return { "qmlls", "-I", qmlls_config }
            end
        end

        -- Default fallback if no config is found
        return { "qmlls" }
    end)(),
    filetypes = { "qml" },
    root_dir = util.root_pattern(".qmlls.ini", "CMakeLists.txt")
}


-- Enable LSP diagnostics
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
})

-- CMake Setup
require("cmake-tools").setup({
    cmake_command = "cmake",        -- CMake command
    cmake_build_directory = "build",  -- Output directory
    cmake_build_type = "Debug",     -- Default build type
    cmake_generate_options = { "-G", "Ninja" },  -- Use Ninja (remove for Make)
    cmake_regenerate_on_save = true,  -- Auto-regenerate on save
})

-- Enable folding for QML file type
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "qml", "cpp", "javascript" }, -- Multiple file types
  callback = function()
    vim.opt_local.foldmethod = "indent"  -- Set indent-based folding
    vim.opt_local.foldenable = false     -- Do not fold by default
  end,
})



require("gitsigns").setup {
  signs = {
    add          = { text = "+" },
    change       = { text = "~" },
    delete       = { text = "-" },
    topdelete    = { text = "‾" },
    changedelete = { text = "~" },
  },
  numhl = false,
  linehl = false,
  word_diff = false,
}
