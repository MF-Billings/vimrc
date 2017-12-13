"set lines=50
"set columns=150
set hidden                  "allow buffer switching without needing to save the current buffer
set autoindent
set number						"show line numbers
set nrformats=					"treat all #s as decimals regardless of whether they're padded with 0s. Useful for <C-a> and <C-x>
syntax on					"enable syntax highlighting
set autochdir					"automatically set the running location of vim to the current folder
set incsearch
set backspace=2			          	"backspace over everything in insert mode							
set sessionoptions+=folds                       "save tabs on session save
set history=200					"increase default history of 20
set hlsearch
set expandtab				"inserts spaces whenever tab key is pressed. For python.
set tabstop=4
set shiftwidth=4
set ruler
set encoding=utf-8          "support display of foreign characters
set fileencoding=utf-8      "support encoding of foreign characters

" BINDINGS
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>		
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
" open current file in web browser. Specific to location of desired browser on executing computer. % shorthand for current file name
nnoremap <F12> :!start C:\Program Files (x86)\Google\Chrome\Application\chrome.exe %<CR>

"file specific settings
autocmd FileType html setlocal shiftwidth=2 tabstop=2
"autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" Make gvim looks more like sublime
colorscheme monokai
set guifont=Consolas:h11
