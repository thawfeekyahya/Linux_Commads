  -- Key mappings                                                                                                                                                                                           
vim.keymap.set('n', '<Leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Find files' })
vim.keymap.set('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'Find Buffers' })
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>', { desc = 'Find Recent Files' })
vim.keymap.set('n', '<Leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
vim.keymap.set('n', '<Leader>t', '<cmd>TagbarToggle<CR>', { desc = 'Toggle Tagbar' })
 


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
