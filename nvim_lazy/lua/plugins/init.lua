return {
  -- Nvim Tree
  {
    "nvim-tree/nvim-tree.lua",
     config = function()
      require("nvim-tree").setup({
        sync_root_with_cwd = true,
      })
    end,
  },

  --Comment.nvim
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
    keys = {
      { "gcc", mode = "n", desc = "Toggle comment line" },
      { "gc", mode = { "n", "v" }, desc = "Toggle comment block" },
    },
  },

  -- Vim Exchange text
  {
     "tommcdo/vim-exchange",
     keys = {
       { "cx", mode = { "n", "v" }, desc = "Exchange text" },
     }
  },

  {"s1n7ax/nvim-window-picker"},
  {'nvim-tree/nvim-web-devicons'},
  
  -- telescope symbol finder
  {'nvim-telescope/telescope-symbols.nvim'},

  -- Native telescope support
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make", },

  -- Git worktree support
  { "ThePrimeagen/git-worktree.nvim"},

  -- Lazy git
  { "kdheepak/lazygit.nvim" },


  --Themes
  { "rose-pine/neovim", name = "rose-pine" },
  { "catppuccin/nvim", name = "catppuccin" },
  { "ellisonleao/gruvbox.nvim"},

  { "nvim-lua/plenary.nvim"},

  {"mfussenegger/nvim-lint"},
  {"mfussenegger/nvim-dap"},  -- Debugging support,

   -- QML Syntax Support,
  {"peterhoeg/vim-qml"},
   
  -- JavaScript/TypeScript Support,
  {"pangloss/vim-javascript"},
  {"MaxMEllon/vim-jsx-pretty"},  -- JSX/TSX support,

  --JS formatter
  {"bfrg/vim-jq"},

  -- fuzzy search,
  {'junegunn/fzf'},
  {'junegunn/fzf.vim'},

}
