return {
  "nvim-tree/nvim-tree.lua",
   config = function()
      require("nvim-tree").setup({
        sync_root_with_cwd = true,
      })
      vim.keymap.set("n", "<leader>o", ":NvimTreeFindFile<CR>", { desc = "Reveal current file in NvimTree" })
   end,
}
