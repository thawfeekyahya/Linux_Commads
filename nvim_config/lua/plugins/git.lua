---require("telescope").load_extension("git_worktree")

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

-- Git shortcuts
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "Open LazyGit" })
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview Git Hunk" })
vim.keymap.set("n", "<leader>gR", ":Gitsigns reset_hunk<CR>", { desc = "Reset Git Hunk" })
vim.keymap.set("n", "<leader>gD", ":Gitsigns diffthis<CR>", { desc = "Git Diff (Current vs HEAD)" })
vim.keymap.set("n", "<leader>gB", ":Gitsigns blame_line<CR>", { desc = "Git Blame" })

-- Telescope git log
vim.keymap.set("n", "<leader>gl", function()
  require("telescope.builtin").git_bcommits()
end, { desc = "Git BCommits" })

vim.keymap.set("n", "<leader>gL", function()
  require("telescope.builtin").git_commits()
end, { desc = "Git Commits" })
