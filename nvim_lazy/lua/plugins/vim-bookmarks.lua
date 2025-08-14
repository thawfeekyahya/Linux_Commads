return {
  'MattesGroeger/vim-bookmarks',
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
  end
}
