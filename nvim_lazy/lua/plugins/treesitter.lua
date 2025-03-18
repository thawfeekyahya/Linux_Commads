return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "c", "cpp", "python", "javascript","vimdoc" }, -- Add any other languages you use
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
