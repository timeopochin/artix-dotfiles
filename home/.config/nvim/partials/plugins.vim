" Load the plugins
call plug#begin('~/.config/nvim/plugins')

Plug 'ptzz/lf.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'morhetz/gruvbox'
"Plug 'lervag/vimtex'
"Plug 'SirVer/ultisnips'
"Plug 'sirtaj/vim-openscad'
Plug 'habamax/vim-asciidoctor'
Plug 'vim-scripts/mom.vim'

call plug#end()

" Plugin settings and keykindngs
colorscheme gruvbox
let g:vimtex_mappings_enabled=0
let g:vimtex_view_method='zathura'
autocmd BufNewFile,BufRead *.mom set filetype=mom
