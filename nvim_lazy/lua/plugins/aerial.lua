return {
  "stevearc/aerial.nvim",
  config = function()
    require("aerial").setup({})
    vim.keymap.set("n", "<leader>to", "<cmd>AerialToggle!<CR>", { desc = "Tree outliner" })
  end,
}
