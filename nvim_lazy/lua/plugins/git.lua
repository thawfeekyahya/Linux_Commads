return {
   {
     -- Git Signs,
     "lewis6991/gitsigns.nvim",
     config = function()
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
      vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Git Hunk" })
      vim.keymap.set("n", "<leader>gR", ":Gitsigns reset_buffer<CR>", { desc = "Git reset current file" })
      vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>", { desc = "Git Diff (Current vs HEAD)" })
      vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "Git Blame" })
      
      -- Telescope git log for currrent buffer
      vim.keymap.set("n", "<leader>gl", function()
        require("telescope.builtin").git_bcommits()
      end, { desc = "Git BCommits" })
      
      -- Telescope git log for current branch 
      vim.keymap.set("n", "<leader>gL", function()
        require("telescope.builtin").git_commits()
      end, { desc = "Git Commits" })
    end
  },

 {"kdheepak/lazygit.nvim"}

}
