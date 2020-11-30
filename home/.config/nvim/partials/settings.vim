set title
set noshowmode
set cursorline
set ignorecase smartcase
set fileencoding=utf-8
set list listchars=tab:\ \ │,trail:█,nbsp:•
set inccommand=nosplit
set noswapfile
set lazyredraw
set splitright splitbelow
set tagcase=followscs
set linebreak showbreak=>\  breakindent
set smartindent tabstop=4 shiftwidth=4
set wrap

set number relativenumber
augroup numbertoggle
	autocmd!
	autocmd	BufEnter,FocusGained,InsertLeave	*	set relativenumber
	autocmd	BufLeave,FocusLost,InsertEnter		*	set norelativenumber
augroup END

" Sync artix-dotfiles
augroup sync_artix_dotfiles
	autocmd!
	autocmd	BufWritePost	$ARTIX_DOTFILES_DIR/home/**	:silent !$ARTIX_DOTFILES_DIR/sync-artix-dotfiles.sh
augroup END
