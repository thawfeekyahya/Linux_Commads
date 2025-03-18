require("nvim-treesitter.configs").setup {
  ensure_installed = { "cpp", "qmljs", "javascript", "typescript", "json", "html", "css" },
  highlight = { enable = true },
}
