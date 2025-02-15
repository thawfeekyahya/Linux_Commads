-- Telescope Key mappings
vim.keymap.set('n', '<Leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Find files' })
vim.keymap.set('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'Find Buffers' })
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>', { desc = 'Find Recent Files' })
vim.keymap.set("n", "<leader>gl", ":Telescope git_bcommits<CR>", { desc = "View Git Log for Current File" })



-- other mappings
vim.keymap.set('n', '<Leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
vim.keymap.set('n', '<Leader>t', '<cmd>TagbarToggle<CR>', { desc = 'Toggle Tagbar' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = "Show diagnostics" })
vim.keymap.set("n", "<leader>nh", ":nohlsearch<CR>", { noremap = true, silent = true })


-- Git shortcuts
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview Git Hunk" })
vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Git Hunk" })
vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>", { desc = "Git Diff (Current vs HEAD)" })
vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "Git Blame" })


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
  use 'preservim/tagbar'

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


  -- Statusline
  use "nvim-lualine/lualine.nvim"

  -- QML Syntax Support
  use "peterhoeg/vim-qml"

  -- JavaScript/TypeScript Support
  use "pangloss/vim-javascript"
  use "MaxMEllon/vim-jsx-pretty"  -- JSX/TSX support

end)


-- Enable Treesitter for better syntax highlighting
require("nvim-treesitter.configs").setup {
  ensure_installed = { "cpp", "qmljs", "javascript", "typescript", "tsx", "json", "html", "css" },
  highlight = { enable = true },
}

-- Setup LSP for C++ (Qt), QML, JavaScript
local lspconfig = require("lspconfig")

-- Enable Clangd for C++ (Qt)
lspconfig.clangd.setup({
  cmd = { "clangd", "--background-index" },
  filetypes = { "cpp", "c", "objc", "objcpp", "h", "hpp" },
})

-- Enable QML LSP (qmlls)
lspconfig.qmlls.setup({
  cmd = { "qmlls" },  -- Make sure you have qmlls6 installed
  filetypes = { "qml" },
})

-- Enable LSP diagnostics
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
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
