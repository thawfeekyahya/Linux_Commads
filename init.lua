-- Key mappings
vim.api.nvim_set_keymap('n', '<Leader>t', ':TagbarToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })


-- Settings
vim.opt.cursorline = true
vim.opt.tags = "./tags;,tags"
vim.opt.foldcolumn = "1"
vim.opt.relativenumber = true
vim.opt.number = true
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

-- Plugin manager (vim-plug in Lua)
require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'  -- Plugin manager
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'preservim/tagbar'

  -- Language Server Protocol (LSP)
  use "neovim/nvim-lspconfig"   -- Base LSP support
  use "hrsh7th/nvim-cmp"        -- Autocompletion
  use "hrsh7th/cmp-nvim-lsp"    -- LSP completion source


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


  -- Statusline
  use "nvim-lualine/lualine.nvim"

  -- QML Syntax Support
  use "peterhoeg/vim-qml"

  -- JavaScript/TypeScript Support
  use "pangloss/vim-javascript"
  use "MaxMEllon/vim-jsx-pretty"  -- JSX/TSX support

end)
