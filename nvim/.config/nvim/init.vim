"
" Vimrc configuration
"

let g:username = "Marko @xmudrii Mudrinic"
let g:email = "marko@xmudrii.com"

"
" vim-plug (plugins)
"
call plug#begin('~/.nvim/plugged')

Plug 'fatih/vim-go'					" Go support for vim
Plug 'ekalinin/Dockerfile.vim', {'for': 'Dockerfile'}	" Dockerfile vim plugin
Plug 'elzr/vim-json', {'for': 'json'}			" Json plugin

Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'} " Deoplete support for vim (autocompletion)
Plug 'zchee/deoplete-go', {'do': 'make'}

Plug 'scrooloose/nerdtree'				" file tree inside vim
Plug 'tpope/vim-commentary'				" comments improved: gc, gcap, gcgc, :7,17Commentary
Plug 'airblade/vim-gitgutter'				" Git diff in Vim
Plug 'AndrewRadev/splitjoin.vim'			" gS & gJ for in-lining and breaking lines

Plug 'flazz/vim-colorschemes'				" Various Vim themes (includes janah)
Plug 'vim-airline/vim-airline'				" Airline status bar
Plug 'vim-airline/vim-airline-themes'			" Airline themes

call plug#end()

"
" Initial settings
"

set noshowmode						" We show mode with airline or lightline
set complete-=i
set clipboard+=unnamed
set clipboard+=unnamedplus

set wildmenu						" Command menu
set wildmode=longest:list,full				" Command menu improved
set wildignorecase					" Ignore case
set completeopt=longest,menuone,noinsert		" Better completion
set mouse=a						" Mouse integration

filetype off
filetype plugin indent on
syntax on

set encoding=utf-8 					" Encoding to utf-8
set autoindent						" Auto indentation
set backspace=indent,eol,start				" Make backspace more powerful
set incsearch						" Shows match while typing commands
set hlsearch						" Highligh found searches
set showmatch						" Matching brackets
set laststatus=2					" Display Status Line always

set noerrorbells					" No beeps/bells
set number						" Show line numbers
set numberwidth=3					" Line number width
set ignorecase						" Case insensitive search
set smartcase						" Case sensitive search if word begins with upper case
set nowrap						" Don't wrap long lines

set cursorline						" Highlight current line
set title						" Inherit title from Vim

set noswapfile						" Don't use swap files
set nobackup						" Don't create backup files
set autowrite						" Automatically save before commands such as :next, :make, etc

set hidden						" Hide buffer instead of closing it
set fileformats=unix,dos,mac				" Prefer Unix over Windows formats

set t_Co=256						" Enable 256 colors
set bg=dark						" Dark background FTW
autocmd ColorScheme janah highlight Normal ctermbg=235	" Configure janah theme
colorscheme janah					" Use janah theme (requires 'flazz/vim-colorschemes')

"
" Various settings
"

autocmd VimResized * :wincmd =				" Automatically rebalace window on resize
set t_ti= t_te=						" Don't clear the screen on exit

function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

"
" Airline settings
"

let g:airline_theme = 'kolor'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

"
" NERDTree
"

let NERDTreeDirArrows=1
let NERDTreeMinimaUI=1
let NETDTreeWinSize=35
let NERDTreeShowLineNumbers = 1				" Make sure that when NT root is changed, Vim's pwd is also updated
autocmd VimEnter * if !argc() | NERDTree | endif	" Open NERDTree if no file is specified

"
" Go settings
"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "locationlist"
let g:go_auto_type_info = 0
let g:go_echo_command_info = 0
let g:go_term_enabled = 1

"
" Deoplete (auto completion)
"

let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1
let g:deoplete#enable_smart_case = 1
call deoplete#custom#source('_', 'converters', ['converter_auto_paren'])
let b:deoplete_ignore_sources = ['around', 'member', 'buffer']

"
" Mappings
"

let mapleader = " "

map <C-n> :cn<CR>					" Quickfix window shortcuts (CTRL+c, CTRL+M, ,a)
map <C-m> :cp<CR>
nnoremap <leader>a :cclose<CR>

augroup quickfix					" Quickfix window always to bottom
	autocmd!
	autocmd FileType qf wincmd J
	autocmd FileType qf setlcal wrap
augroup END

autocmd BufEnter * silent! lcd %:p:h			" Enter automatically into the file's directory

nnoremap <leader>w :w!<cr>				" Fast saving shortcuts (Leader+w)
nnoremap <silent> <leader>q :q!<CR>			" Close file without saving (Leader + q)
nnoremap <leader>o :only<CR>				" Close all files but current one (Leader+o)

nnoremap <leader><space> :nohlsearch<CR>		" Remove search highlight (Leader+<space>)

nmap <leader>v :vsplit<CR> <C-w><C-w>			" Split window vertically (Leader+v)
nmap <leader>s :split<CR> <C-w><C-w>			" Split window horizontally <Leader+s>

map <C-j> <C-W>j					" Easier split switching (CTRL+jkhl, default: CTRL+W+jkhl)
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <leader>\ :NERDTreeToggle<cr>			" Show file tree (Leader+\)
map <leader>/ :Commentary<CR>				" Comment line (Leader+/)
map <leader>g :GitGutterToggle<CR>			" Toggle Git Diff (Leader+g>

augroup go						" Gopherz
  autocmd!

  autocmd FileType go nmap <silent> <leader>i <Plug>(go-info)		     " Show go-info (Leader+i)
  autocmd FileType go nmap <silent> <leader>t <Plug>(go-test)		     " Run Tests (Leader+t)
  autocmd FileType go nmap <silent> <leader>r <Plug>(go-run)		     " Run (Leader+r)
  autocmd FileType go nmap <silent> <leader>d <Plug>(go-doc)		     " Show Docs (Leader+d)
  autocmd FileType go nmap <silent> <leader>c <Plug>(go-coverage-toggle)     " Show Coverage (Leader+c)

  autocmd FileType go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd FileType go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd FileType go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
augroup END

