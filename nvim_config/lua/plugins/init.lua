require("packer").startup(function(use)
  use 'wbthomason/packer.nvim'

   -- Statusline
  use "nvim-lualine/lualine.nvim"

  -- Code Formatter
  use "mhartington/formatter.nvim"

  -- Nvim session manager
  use "stevearc/resession.nvim"

  -- File Outline with dependencies
  use {
    'stevearc/aerial.nvim',
    opts = {},
    config = function()
      require("aerial").setup()
    end
  }
  
  -- Treesitter for better syntax highlighting
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  use "nvim-lua/plenary.nvim"

   -- Fuzzy Finder (Telescope)
  use "nvim-telescope/telescope.nvim" 

  use 'nvim-tree/nvim-web-devicons'
  
  -- telescope symbol finder
  use 'nvim-telescope/telescope-symbols.nvim'

  -- fuzzy search
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

  -- CMake Integration
  use 'Civitasv/cmake-tools.nvim'

  -- Git Signs
  use "lewis6991/gitsigns.nvim"
  
  -- Lazy Git
  use "kdheepak/lazygit.nvim"

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
     config = function()
       require("nvim-tree").setup()
     end
   }
   
   -- QML Syntax Support
   use "peterhoeg/vim-qml"
   
   -- JavaScript/TypeScript Support
   use "pangloss/vim-javascript"
   use "MaxMEllon/vim-jsx-pretty"  -- JSX/TSX support
   
   --Themes
  use { "rose-pine/neovim", as = "rose-pine" }
  use { "catppuccin/nvim", as = "catppuccin" }

  -- JS formatter
  use "bfrg/vim-jq"

  -- Marks 
  use 'chentoast/marks.nvim'

  -- Status Bar
  use 'nvim-lualine/lualine.nvim'

end)
