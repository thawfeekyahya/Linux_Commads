return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  event = { "BufReadPost", "BufNewFile" },

  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "query",
      "c",
      "cpp",
      "python",
      "javascript",
    },

    auto_install = true,

    highlight = {
      enable = true,
    },

    indent = {
      enable = true,
    },
  },
}
