autocmd!
let mapleader=" "

set nocompatible
set noshowmode
set ttyfast

" 24 bit
set termguicolors

set backspace=indent,eol,start
set complete-=i

" easier regex
set magic

set autoindent

set mouse=a

set clipboard+=unnamedplus

" ctrl-a ctrl-x behaviour
set nrformats-=octal
set sidescrolloff=5
set encoding=utf-8

" searches show in middle of screen
set scrolloff=3
set scrolljump=5

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

"stop being annoying
set visualbell

"Ignore case when searching
set ignorecase
set smartcase

"Highlight search things
set hlsearch

"do not clear the screen on exit
set t_ti= t_te=

set incsearch
set showmatch

filetype plugin on
filetype indent on
syntax on

set wildmenu
set wildmode=longest:list,full
set wildignorecase
set completeopt=longest,menuone,noinsert

"stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=.git/**
set wildignore+=public/assets/**
set wildignore+=vendor/**
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=Cellar/**
set wildignore+=app/assets/images/**
set wildignore+=_site/**
set wildignore+=home/.vim/bundle/**
set wildignore+=pkg/**
set wildignore+=**/.gitkeep
set wildignore+=**/.DS_Store
set wildignore+=**/*.netrw*
set wildignore+=node_modules/*


call plug#begin('~/.nvim/plugged')
" autocomplete
Plug 'vim-syntastic/syntastic'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" tools
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-rooter'
Plug 'scrooloose/nerdtree'

" text manipulation
Plug 'tomtom/tcomment_vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-surround'

" ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'alexgenco/neovim-ruby', { 'for': 'ruby' }
Plug 'fishbullet/deoplete-ruby', { 'for': 'ruby' }

" go
Plug 'fatih/vim-go'
Plug 'jodosha/vim-godebug'
Plug 'zchee/deoplete-go', { 'do': 'make'}

" html
Plug 'ap/vim-css-color'
Plug 'vim-scripts/closetag.vim'

" terraform / hcl
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-hclfmt'

" cosmetic
Plug 'flazz/vim-colorschemes'
Plug 'jacoborus/tender.vim'
Plug 'ryanoasis/vim-devicons'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

set rtp+=$HOME/.nvim/plugged/vim-go/syntax

" statusline
set laststatus=2

function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

" Make it obvious
set textwidth=140
set colorcolumn=121

" Numbers
set number
set numberwidth=3

" open files not tied to buffers
set hidden


set shortmess+=c

" no regerts
set nobackup
set nowb

set title
set cursorline

" do not wrap long lines
set nowrap

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" Display extra whitespace
set list listchars=tab:\ \ ,trail:·,extends:>,precedes:<,nbsp:+

" Highlight listchars
"highlight SpecialKey ctermbg=red guibg=red

" css
" Allow stylesheets to autocomplete hyphenated words
autocmd FileType css,scss,sass setlocal iskeyword+=-

" ruby mappings
au BufRead,BufNewFile *.pill set ft=ruby
au BufRead,BufNewFile Gemfile set ft=ruby
au BufRead,BufNewFile Appraisals set filetype=ruby

" EJSON
au BufNewFile,BufRead *.ejson set filetype=json

" html
au! BufRead,BufNewFile *.ejs setfiletype html

" markdown
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.md setlocal textwidth=120
au FileType markdown setlocal spell

autocmd FileType gitcommit setlocal spell

"enable 256 colors
set t_Co=256

set bg=dark
autocmd ColorScheme janah highlight Normal ctermbg=235
colorscheme janah

" no powerline
let g:airline_left_sep = "\ue0c6"
let g:airline_right_sep = "\ue0c7"

let g:airline_theme = 'kolor'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" erb html tags
let g:closetag_filenames = "*.html.erb,*.html,*.xhtml,*.phtml"

" syntastic
" mark syntax errors with :signs
let g:syntastic_enable_signs=1
" automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
" do not show the error list automatically
let g:syntastic_auto_loc_list=0
" still populate it
let g:syntastic_always_populate_loc_list = 1

let g:syntastic_check_on_wq = 0

let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

" go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_options = {
  \ 'goimports': '-local do/',
  \ }
let g:go_list_type = "locationlist"
let g:go_auto_type_info = 0
let g:go_echo_command_info= 0
let g:go_term_enabled = 1


" markdown
let g:vim_markdown_folding_disabled = 1

" rooter
let g:rooter_patterns = ['cmd/', 'Rakefile', 'Dockerfile', 'docker-compose.yml', '.git/' ]
let g:rooter_silent_chdir = 1

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1
let g:deoplete#enable_smart_case = 1
" needed so it doesn't override vim-go cmdline after completion
call deoplete#custom#set('_', 'converters', ['converter_auto_paren'])

" only show stuff coming from tags, buffers, etc (not random text that is around)
let b:deoplete_ignore_sources = ['around', 'member', 'buffer']


autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" NERDTree
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.o$', '\.pyc$', '\.php\~$']
let NERDTreeWinSize = 35

" Make sure that when NT root is changed, Vim's pwd is also updated
let NERDTreeShowLineNumbers = 1

" Open NERDTree on startup, when no file has been specified
autocmd VimEnter * if !argc() | NERDTree | endif

" Bindings
" terminal
tnoremap kj <C-\><C-n>

" Normal
" Make it way easier to switch windows (<leader>w)
nmap <leader>w <C-w><C-w>_
"remove extra white space from line end
noremap <leader>s :%s/\s\+$//g<CR>
" Use <C-L> to clear the highlighting of :set hlsearch.
nnoremap <silent> <leader>l :set hlsearch! hlsearch?<CR>
" ctrl-p
nnoremap <silent> <C-p> :FZF<CR>
nnoremap <leader><space> :Buffers<CR>
" tagbar
nmap <leader><Enter> :TagbarToggle<CR>
" search
nmap <leader>a :Ag<space>
" git gutter toggle
nmap <leader>g :GitGutterToggle<CR>
" split vertically with <leader> v
" split horizontally with <leader> s
nmap <leader>v :vsplit<CR> <C-w><C-w>
nmap <leader>s :split<CR> <C-w><C-w>

nnoremap <tab> :bn<CR>
nnoremap <s-tab> :bp<CR>

" comments
vmap // :TComment<CR>

" Toogle dirlist on/off
nmap <leader>\ :NERDTreeToggle<cr>

" completion stuff
imap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ deoplete#mappings#manual_complete()
		function! s:check_back_space() abort "{{{
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
		endfunction"}}}
imap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
imap <expr> <cr>    pumvisible() ? deoplete#close_popup() : "\<cr>"

" gopherz
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

augroup go
  autocmd!

  autocmd FileType go nmap <silent> <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <silent> <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <silent> <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <silent> <leader>r  <Plug>(go-run)

  autocmd FileType go nmap <silent> <Leader>d <Plug>(go-doc)
  autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)

  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
augroup END
