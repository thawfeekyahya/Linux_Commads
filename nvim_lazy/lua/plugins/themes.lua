local M = {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,    -- Load this immediately on startup
    priority = 1000, -- High priority so it loads before other UI plugins
    config = function()
      -- Configure the theme options here if needed
      require("catppuccin").setup({
        flavour = "frappe", -- latte, frappe, macchiato, mocha
        transparent_background = false,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = true,
          mini = true,
        },
      })
    end,
  },
}

-- Apply Default colorscheme 
vim.cmd.colorscheme("catppuccin")

return M
