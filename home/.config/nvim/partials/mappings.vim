" movement
noremap r <left>
noremap s <right>
noremap i g<up>
noremap t g<down>

noremap <silent> <c-r> :wincmd h<cr>
noremap <silent> <c-s> :wincmd l<cr>
noremap <silent> <c-i> :wincmd k<cr>
noremap <silent> <c-t> :wincmd j<cr>

" insert mode
nnoremap h i

" line moving
"nnoremap <c-i> :m .-2<cr>==
"nnoremap <c-t> :m .+1<cr>==

" saving
"nnoremap <return> :wq<cr>
tnoremap <c-n> <c-\><c-n>
