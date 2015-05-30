" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" System Environment
set nocompatible        			" Vim, not vi
set shell=bash
set ttyfast                   " We have a fast terminal
set noerrorbells              " No error bells please
set novisualbell              " Don't blink
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif
set exrc                      " Local vimrc
set secure                    " Prevent certain commands in local vimrc

" Encoding
set fileformat=unix						" Default
set fileformats=unix,dos,mac	" Supporting end-of-line
set encoding=utf-8
set fileencodings=utf-8

" Editing
set autoindent
set smartindent
set nostartofline             " Don't change cursor position
set tabstop=2									" A tab looks like 2 columns
set shiftwidth=2							" 2 columns are indented with << or >> 
set shiftround                " Shift round to nearest indentation
set smarttab									" Backspace delete appropriate spaces
set expandtab									" Replace tab with spaces
set backspace=indent,eol,start
set clipboard+=unnamed

" Navigating
set mouse=a                   " Use mouse everywhere
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Spell check
set spell
highlight clear SpellBad
highlight SpellBad cterm=underline

" Appearance
set background=dark
set ruler             			  " Show the line number on the bar
set number              			" Line numbers
set cursorline								" Line under cursor
" set textwidth=80              " We like 80 column
set scrolloff=10							" Keep at least 10 lines above/below
set sidescrolloff=10          " Keep at least 10 lines left/right
set lazyredraw          			" Don't redraw when don't have to
set noerrorbells              " Don't make noise
set linespace=0               " Don't insert any extra pixel betweens rows
set list                      " Show tabs and spaces so we can remove them
set listchars=tab:\ \ ,trail:.
" set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
"             | | | | | | | | |
"             | | | | | | | | +-- "]" Insert and Replace
"             | | | | | | | +-- "[" Insert and Replace
"             | | | | | | +-- "~" Normal
"             | | | | | +-- <Right> Normal and Visual
"             | | | | +-- <Left> Normal and Visual
"             | | | +-- "l" Normal and Visual (not recommended)
"             | | +-- "h" Normal and Visual (not recommended)
"             | +-- <Space> Normal and Visual
"             +-- <BS> Normal and Visual

" Backup
set hidden            			  " Hide buffers when they are abandoned
set history=9999              " Big old history
set timeoutlen=300            " Super low delay
set undolevels=1000           " 1000 undo
set updatecount=100           " Switch every 100 chars
set autoread            			" Watch for file changes
set noautowrite         			" Don't automatically write on :next
set backupdir=~/.vim/backup   " Where to put backup files
set directory=~/.vim/temp     " Where to place swap files in
set formatoptions+=n          " Recognize numbered lists
set formatlistpat=^\\s*\\(\\d\\\|[-*]\\)\\+[\\]:.)}\\t\ ]\\s* 
                              " And bullets, too
set viminfo+=!                " Store upper-case registers in viminfo
set nomore                    " Short nomore

" Vim Command
set wildmenu                  " Menu has tab completion
set wildchar=<Tab>
set wildmode=longest,list,full
set laststatus=2
set showcmd 									" Show (partial) command in status line
set showmode									" Show current mode
set more              			  " Use more prompt
set cmdheight=2               " Command line two lines high
set report=0                  " Always report all messages
set shortmess=aOstT           " To avoid 'press a key' prompt
" set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%02v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    + current column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in square brackets
"              | | | | |  |   +-- current file format
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- read-only flag in square brackets
"              | +-- modified flag in square brackets
"              +-- full path to file in the buffer

" Searching
set incsearch                 " Incremental search
set ignorecase                " Search ignoring case
set smartcase         			  " Do smart case matching
set showmatch                 " Show matching bracket
set matchtime=5               " How many 1/10 seconds to blink
set diffopt=filler,iwhite     " Ignore all whitespace and sync
set hlsearch                  " Highlight the search
set iskeyword+=_,$,@,%,#
nnoremap <Leader>q :nohlsearch<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*~,*.pyc,*.class

" Folding
set foldenable
" set foldmethod=syntax
" set foldmethod=indent
" set foldlevelstart=1
" set foldnestmax=3             " Deepest fold is 3 levels
nnoremap <space> za
vnoremap <space> zf

nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$

nnoremap <F5> :make<CR>

" Syntax and Semantics
syntax on
set complete=.,w,b,u,U,t,i,d  " Scan upon tab completion
set completeopt=menu,preview

" Vundle and Plug-in
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

" Vundle
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Nerd Tree
Plugin 'scrooloose/nerdtree'
noremap <F2> :NERDTreeToggle<CR>

" Tarbar
Plugin 'majutsushi/tagbar'
nmap <F3> :TagbarToggle<CR>

" You Complete Me
Plugin 'Valloric/YouCompleteMe'
nnoremap <leader>g :YcmCompleter GoTo<CR>
" let g:ycm_path_to_python_interpreter = '/usr/local/bin/python'
let g:ycm_confirm_extra_conf = 0
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

" Ctrl-p
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
let g:Powerline_symbols = 'fancy'

" Syntax Checking
Plugin 'scrooloose/syntastic'

" Git inside Vim
Plugin 'tpope/vim-fugitive'

" A.vim for C/C++
Plugin 'a.vim'
nnoremap <F4> :A<CR>
autocmd FileType c set foldmethod=syntax
autocmd FileType cpp set foldmethod=syntax

" Python folding
Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview = 1

" Cython
Plugin 'tshirtman/vim-cython'

" Go
Plugin 'fatih/vim-go'

" JavaScript
Plugin 'moll/vim-node'
Plugin 'marijnh/tern_for_vim'
Plugin 'heavenshell/vim-jsdoc'

" Scala
Plugin 'derekwyatt/vim-scala'

" Rust
Plugin 'rust-lang/rust.vim'
Plugin 'phildawes/racer'
autocmd FileType rust nnoremap <leader>g :call RacerGoToDefinition()<cr>
autocmd FileType rust set makeprg=cargo\ test\ --\ --nocapture
autocmd FileType rust let g:ycm_semantic_triggers = { 'rust' : ['::', '.'] }
autocmd FileType rust set foldmethod=syntax

" Markdown
Plugin 'coryfklein/vim-markdown'

" Dash for Documentation on Mac OS X
Plugin 'rizzatti/dash.vim'
nmap <silent> <leader>h <Plug>DashSearch

" Solarized color scheme
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on    " required

let g:solarized_termtrans = 1
colorscheme solarized
highlight Cursorline term=bold cterm=bold
