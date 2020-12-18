" movement
noremap r h
noremap s l
noremap i gk
noremap t gj

noremap <silent> <c-r> :wincmd h<cr>
noremap <silent> <c-s> :wincmd l<cr>
noremap <silent> <c-i> :wincmd k<cr>
noremap <silent> <c-t> :wincmd j<cr>

" insert mode
nnoremap l :Lf<cr>
noremap k r
noremap h i
noremap j s

" line moving
"nnoremap <c-i> :m .-2<cr>==
"nnoremap <c-t> :m .+1<cr>==

" saving
inoremap <esc> <esc>:w<cr>
tnoremap <c-n> <c-\><c-n>
