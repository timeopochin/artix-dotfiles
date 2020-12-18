command -nargs=+ Mom autocmd FileType mom <args>

"Mom inoremp

"Mom inoremap <tab>' ’

"Mom inoremap <tab>e é
"Mom inoremap <tab>E É
Mom inoremap <expr> e Snip("'e", 'e', 'é')
Mom inoremap <expr> ' Snip("''", "'", '’')

Mom inoremap <expr> < Snip('\<\<', '<', '« ')
Mom inoremap <expr> > Snip('([a-z?!.,)])@<= *\>\>', '>', ' »')
Mom inoremap <expr> ? Snip('([a-z»])@<= *\?', '?', ' ?')

function! Snip(regex, char, result) abort
	let before_cursor = getline('.')[:col('.') - 2] . a:char
	let matched = matchstr(before_cursor, '\v' . a:regex . '$')
	if empty(matched)
		return a:char
	endif
	return repeat("\b", strlen(matched) - 1) . a:result
endfunction

