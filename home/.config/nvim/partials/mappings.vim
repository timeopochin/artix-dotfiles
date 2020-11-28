" movement
noremap r <left>
noremap s <right>
noremap i g<up>
noremap t g<down>

noremap h i

" line moving
nnoremap <c-i> :m .-2<cr>==
nnoremap <c-t> :m .+1<cr>==

" saving
"nnoremap <return> :wq<cr>
inoremap <esc> <esc>:w<cr>
