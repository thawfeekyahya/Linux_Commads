return {
  -- 1. Manage and download the rust-analyzer binary automatically
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "rust-analyzer" },
    },
  },

  -- 2. Configure Rust LSP, Diagnostics, and Debugging
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended to pin to a major version
    lazy = false,   -- This plugin already handles its own lazy loading
    config = function()
      vim.g.rustaceanvim = {
        server = {
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
        },
      }
    end,
  },
}

