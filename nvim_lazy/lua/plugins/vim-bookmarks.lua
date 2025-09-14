return {
  'MattesGroeger/vim-bookmarks',
  init =  {
    vim.g.bookmark_no_default_key_mappings = 1
  },
  dependencies = {
    'nvim-telescope/telescope.nvim',
    {
      'tom-anders/telescope-vim-bookmarks.nvim',
      config = function()
        require('telescope').load_extension('vim_bookmarks')
      end
    }
  },
  config = function()
    vim.g.bookmark_save_per_working_dir = 1
    vim.g.bookmark_auto_save = 1
    vim.g.bookmark_auto_close = 1
    vim.api.nvim_set_keymap("n", "mm", "<Plug>BookmarkToggle", {})
    vim.api.nvim_set_keymap("n", "mi", "<Plug>BookmarkAnnotate", {})
    vim.api.nvim_set_keymap("n", "mn", "<Plug>BookmarkNext", {})
    vim.api.nvim_set_keymap("n", "mp", "<Plug>BookmarkPrev", {})
  end
}
