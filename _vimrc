call plug#begin()

call plug#end()

" MY TWEAKS ==================================================================

"set grepprg=grep\ -n $*
set grepprg=grep\ -n
set lines=50
set columns=150
set hidden                  "allow buffer switching without needing to save the current buffer
set autoindent
set number						"show line numbers
set nrformats=					"treat all #s as decimals regardless of whether they're padded with 0s. Useful for <C-a> and <C-x>
syntax on					"enable syntax highlighting
"set autochdir					"automatically set the running location of vim to the current folder
set incsearch
set backspace=2			          	"backspace over everything in insert mode							
set sessionoptions+=folds                       "save tabs on session save
set history=200					"increase default history of 20
set hlsearch
"set expandtab				"inserts spaces whenever tab key is pressed. For python.
set tabstop=4
set shiftwidth=4
set ruler
set encoding=utf-8          "support display of foreign characters
set fileencoding=utf-8      "support encoding of foreign characters
filetype plugin indent on

" BINDINGS
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>		
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

nnoremap <F11> :!ctags --exclude=.svn --exclude=vendor --exclude=public --exclude=shared --exclude=tests --exclude=*.min.js -R
" open current file in web browser. Specific to location of desired browser on executing computer. % shorthand for current file name
nnoremap <F12> :!start C:\Program Files (x86)\Google\Chrome\Application\chrome.exe %<CR>
" print current day
nnoremap <F11> :put =strftime('%a %d %b %Y')

"file specific settings
autocmd FileType html setlocal shiftwidth=2 tabstop=2
"autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" Make gvim looks more like sublime
" colorscheme monokai
set guifont=Consolas:h11

" FUNCTIONS /=======================================================================================================

" a filtered grep search for use on Windows
" from https://chrisseroka.wordpress.com/2017/04/08/vim-better-grepping-in-windows with a few corrections
" Spaces in the arguments must be prepended with a backslash
" @param search_string the string to search for
function! WinGrep(search_string) abort
	let path_to_file_search_list = "\\%userprofile\\%\\file_search_list.tmp"
	let command = "silent ! dir /s/b/a:-d"
	let command = command . " | findstr /v \\node_modules\\"
	let command = command . " | findstr /v \\vendor\\"
	let command = command . " | findstr /v \\\.git\\"
	let command = command . " | findstr /v \\\.svn"
	let command = command . " | findstr /v \.map$"
	let command = command . " | findstr /v tags$"
	let command = command . " | findstr /v \.swp$"
	" add excludes here ------^
	let command = command . " > ".path_to_file_search_list
	execute command 
	execute "grep /F:".path_to_file_search_list." ".a:search_string
endfunction
	
:command! -nargs=+ -complete=command GrepWindows call WinGrep(<f-args>)
