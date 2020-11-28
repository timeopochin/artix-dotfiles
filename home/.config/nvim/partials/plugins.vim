" Load the plugins
call plug#begin('~/.config/nvim/plugins')

Plug 'ptzz/lf.vim'
Plug 'rbgrouleff/bclose.vim'

Plug 'morhetz/gruvbox'

call plug#end()

" Plugin settings and keykindngs
nnoremap l :Lf<cr>

colorscheme gruvbox
