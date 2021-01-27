command! -nargs=+ Mom autocmd FileType mom <args>

Mom nnoremap <expr> <c-p> PreviewEqn()

function! PreviewEqn()
	let start = search('^\.EQ$', 'b')
	let end = search('^\.EN$')
	let equation = join(getline(start, end), "\n")
	call system('eqn -Tpdf | groff -Tpdf | zathura -', equation)
endfunction
