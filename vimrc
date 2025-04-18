nnoremap <Leader>t :TagbarToggle<CR>
nnoremap <leader>f :Files<CR>
set cursorline
set tags=./tags;,tags
set foldcolumn=1
set relativenumber
set number
syntax on
filetype plugin indent on
au FileType cpp setlocal expandtab shiftwidth=4 tabstop=4

  
" Use xclip for clipboard operations
  if executable('xclip')
  augroup XclipYank
   autocmd!
   autocmd TextYankPost * if v:event.operator is 'y' | call system('xclip -selection clipboard', @0) | endif     
   augroup END
endif



" plug begin -------------------------------------------------- 
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
"Plug 'Valloric/YouCompleteMe'
"Plug 'sheerun/vim-polyglot'
"Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/tagbar'
Plug 'peterhoeg/vim-qml'

call plug#end()
" plug end-------------------------------------------------- 


" YouCompleteMe settings
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_key_invoke_completion = '<C-Space>'
