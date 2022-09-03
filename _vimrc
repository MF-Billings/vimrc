
" VUNDLE =================================================================

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim
call vundle#begin('$HOME/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Syntastic'
"Plugin 'honza/vim-snippets' " Snippets are separated from the engine. Add this if you want them:

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
"
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" REQUIRED FOR PLUGINS ==================================================================

" Syntastic
" recommended defaults
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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
colorscheme monokai
set guifont=Consolas:h11

" Pathogen package manager (using Vundle atm)
" execute pathogen#infect()

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
