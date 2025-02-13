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

-- Initialize packer.nvim
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- Plugin manager itself
  use 'wbthomason/packer.nvim'

  -- File Finder (fzf)
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

  -- Auto-pairing brackets
  use 'jiangmiao/auto-pairs'

  -- Tagbar for code navigation
  use 'preservim/tagbar'

  -- QML syntax highlighting
  use 'peterhoeg/vim-qml'
end)

