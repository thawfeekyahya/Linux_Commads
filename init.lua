-- Key mappings
vim.api.nvim_set_keymap('n', '<Leader>t', ':TagbarToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>f', ':Files<CR>', { noremap = true, silent = true })

-- Settings
vim.opt.cursorline = true
vim.opt.tags = "./tags;,tags"
vim.opt.foldcolumn = "1"
vim.opt.relativenumber = true
vim.opt.number = true
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

-- Use xclip for clipboard operations
if vim.fn.executable('xclip') == 1 then
  vim.api.nvim_create_augroup("XclipYank", { clear = true })
  vim.api.nvim_create_autocmd("TextYankPost", {
    group = "XclipYank",
    pattern = "*",
    callback = function()
      if vim.v.event.operator == "y" then
        vim.fn.system("xclip -selection clipboard", vim.fn.getreg('"'))
      end
    end
  })
end

-- Plugin manager (vim-plug in Lua)
vim.cmd [[
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/tagbar'
Plug 'peterhoeg/vim-qml'

call plug#end()
]]

-- YouCompleteMe settings (Commented out as in original)
-- vim.g.ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
-- vim.g.ycm_confirm_extra_conf = 0
-- vim.g.ycm_key_invoke_completion = '<C-Space>'
