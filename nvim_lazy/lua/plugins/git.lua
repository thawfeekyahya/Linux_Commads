return {
  -- Git Signs
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup({
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

      current_line_blame = true, -- optional: shows blame info inline
      current_line_blame_opts = {
        delay = 500,
        virt_text_pos = "eol", -- "eol" instead of "right_align"
      },
    })

    -- Git shortcuts
    vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "Open LazyGit" })
    vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview Git Hunk" })
    vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Git Hunk" })
    vim.keymap.set("n", "<leader>gR", ":Gitsigns reset_buffer<CR>", { desc = "Git reset current file" })
    vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>", { desc = "Git Diff (Current vs HEAD)" })
    vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "Git Blame" })
  end,
}
