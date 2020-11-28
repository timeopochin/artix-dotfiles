" Load the plugins
call plug#begin('~/.config/nvim/plugins')

Plug 'ptzz/lf.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'morhetz/gruvbox'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'

call plug#end()

" Plugin settings and keykindngs
nnoremap l :Lf<cr>
colorscheme gruvbox
let g:vimtex_mappings_enabled=0
let g:vimtex_view_method='zathura'
