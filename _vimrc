"set lines=50
"set columns=150
set expandtab				            "for python
set autoindent
set nu						              "show line numbers
set nrformats=			            "treat all #s as decimals regardless of whether they're padded with 0s. Useful for <C-a> and <C-x>
syntax on					              "enable syntax highlighting
set autochdir				            "automatically set the running location of vim to the current folder
set incsearch
set backspace=2			          	"backspace over everything in insert mode							
set sessionoptions+=folds       "save tabs on session save
set history=200					        "increase default history of 20
set tabstop=4

" BINDINGS
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>		
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
" open current file in web browser. Specific to location of desired browser on executing computer. % shorthand for current file name
nnoremap <F12> :!start C:\Program Files (x86)\Google\Chrome\Application\chrome.exe %<CR>

" FILE SPECIFIC
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" COLORS
"color dracula
colorscheme zenburn				
