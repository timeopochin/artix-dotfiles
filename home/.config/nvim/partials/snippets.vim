function! Snip(snips) abort
	for [ regex, result, remove ] in a:snips
		let before_cursor = getline('.')[:col('.') - 2]
		let matched = matchstr(before_cursor, '\v\C' . regex . '$')
		echom matched
		if !empty(matched)
			if remove
				call feedkeys(repeat("\b", strlen(matched)), 'n')
			endif
			call feedkeys(result, 'n')
		endif
	endfor
endfunction

function! TestSnips() abort
	" [ 'pattern before cursor', 'key sequence to execute', 'remove match' ]
	call Snip([[ '([^,][0-9]+(,[0-9]{2})?)@<=eur', '€', 1 ],
	\          [ 'eur\t', '€', 1 ],
	\          [ '([^.][0-9]+(\.[0-9]{2})?)@<=gbp', "\<ESC>Bi£\<ESC>Ea", 1 ],
	\          [ 'gbp\t', '£', 1 ],
	\          [ '([^.][0-9]+(\.[0-9]{2})?)@<=usd', "\<ESC>Bi$\<ESC>Ea", 1 ]])
endfunction

augroup Snippets
	autocmd!
	autocmd TextChangedI * call TestSnips()
augroup END
