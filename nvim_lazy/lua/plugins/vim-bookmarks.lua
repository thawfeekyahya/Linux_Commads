return {
  "MattesGroeger/vim-bookmarks",
  init = function()
    vim.g.bookmark_no_default_key_mappings = 1
  end,
  dependencies = {
    "nvim-telescope/telescope.nvim",
    {
      "tom-anders/telescope-vim-bookmarks.nvim",
      config = function()
        require("telescope").load_extension("vim_bookmarks")
      end,
    },
  },
  config = function()
    -- plugin options
    vim.g.bookmark_save_per_working_dir = 1
    vim.g.bookmark_auto_save = 1
    vim.g.bookmark_auto_close = 1

    -- bookmark keymaps
    vim.keymap.set("n", "mm", "<Plug>BookmarkToggle", { desc = "Toggle bookmark" })
    vim.keymap.set("n", "mi", "<Plug>BookmarkAnnotate", { desc = "Annotate bookmark" })
    vim.keymap.set("n", "mn", "<Plug>BookmarkNext", { desc = "Next bookmark" })
    vim.keymap.set("n", "mp", "<Plug>BookmarkPrev", { desc = "Previous bookmark" })

    -- telescope keymaps for bookmarks
    vim.keymap.set("n", "<leader>mb", "<cmd>Telescope vim_bookmarks all<CR>", { desc = "List all bookmarks" })
    vim.keymap.set("n", "<leader>ml", "<cmd>Telescope vim_bookmarks current_file<CR>", { desc = "List bookmarks in file" })
  end,
}

