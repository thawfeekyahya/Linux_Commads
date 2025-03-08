local session_manager = require('session_manager')
local config = require('session_manager.config')

session_manager.setup({
  autoload_mode = config.AutoloadMode.LastSession,
  autosave_last_session = true,
  autosave_ignore_dirs = { "~/", "/tmp" }
})

-- Keybindings for session management
vim.api.nvim_set_keymap('n', '<leader>sm', ':SessionManager save_current_session<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sl', ':SessionManager load_last_session<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sd', ':SessionManager delete_session<CR>', { noremap = true, silent = true })
