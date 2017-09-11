" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" System Environment
set nocompatible              " Vim, not vi
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
set fileformat=unix           " Default
set fileformats=unix,dos,mac  " Supporting end-of-line
set encoding=utf-8
set fileencodings=utf-8

" Editing
set autoindent
set smartindent
set nostartofline             " Don't change cursor position
set tabstop=2                 " A tab looks like 2 columns
set shiftwidth=2              " 2 columns are indented with << or >> 
set shiftround                " Shift round to nearest indentation
set smarttab                  " Backspace delete appropriate spaces
set expandtab                 " Replace tab with spaces
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
set ruler                     " Show the line number on the bar
set number                    " Line numbers
set cursorline                " Line under cursor
set scrolloff=5               " Keep at least 10 lines above/below
set sidescrolloff=10          " Keep at least 10 lines left/right
set lazyredraw                " Don't redraw when don't have to
set noerrorbells              " Don't make noise
set linespace=0               " Don't insert any extra pixel betweens rows
set list                      " Show tabs and spaces so we can remove them
set listchars=tab:\ \ ,trail:.

" Backup
set hidden                    " Hide buffers when they are abandoned
set history=9999              " Big old history
set timeoutlen=300            " Super low delay
set undolevels=1000           " 1000 undo
set updatecount=100           " Switch every 100 chars
set autoread                  " Watch for file changes
set noautowrite               " Don't automatically write on :next
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
set showcmd                   " Show (partial) command in status line
set showmode                  " Show current mode
set more                      " Use more prompt
set cmdheight=2               " Command line two lines high
set report=0                  " Always report all messages
set shortmess=aOstT           " To avoid 'press a key' prompt

" Searching
set incsearch                 " Incremental search
set ignorecase                " Search ignoring case
set smartcase                 " Do smart case matching
set showmatch                 " Show matching bracket
set matchtime=5               " How many 1/10 seconds to blink
set diffopt=filler,iwhite     " Ignore all whitespace and sync
set hlsearch                  " Highlight the search
set iskeyword+=_,$,@,%,#
nnoremap <Leader>q :nohlsearch<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*~,*.pyc,*.class

" Folding
set foldenable
set foldlevelstart=0
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

filetype off
set rtp+=~/.vim/bundle/Vundle.vim

" Vundle
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Directory Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
noremap <F2> :NERDTreeToggle<CR>

" Tagging
Plugin 'majutsushi/tagbar'
nmap <F3> :TagbarToggle<CR>

" Semantic Completer
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
nnoremap <leader>g :YcmCompleter GoTo<CR>
let g:ycm_confirm_extra_conf = 0
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

" Project Navigation
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" Searching
Plugin 'rking/ag.vim'
Plugin 'dyng/ctrlsf.vim'

" Syntax Checking
Plugin 'vim-syntastic/syntastic'

" Git inside Vim
Plugin 'tpope/vim-fugitive'

" C/C++
Plugin 'a.vim'
nnoremap <F4> :A<CR>
set foldmethod=syntax

" Java & Scala
Plugin 'derekwyatt/vim-scala'
Plugin 'ensime/ensime-vim'
autocmd BufWritePost *.scala silent :EnTypeCheck
nnoremap <leader>t :EnTypeCheck<CR>
au FileType java nnoremap <leader>g :EnDeclaration<CR>
au FileType scala nnoremap <leader>g :EnDeclaration<CR>

" Python
Plugin 'tmhedberg/SimpylFold'
Plugin 'tshirtman/vim-cython'
let g:SimpylFold_docstring_preview = 1

" Go
Plugin 'fatih/vim-go'
autocmd FileType go nnoremap <leader>g :GoDef<CR>

" Rust
Plugin 'rust-lang/rust.vim'
let g:ycm_rust_src_path = '/usr/local/src/rust/src'

" Bazel
Plugin 'google/vim-ft-bzl'

" Tex
Plugin 'lervag/vimtex'

" Pandoc
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-pandoc'

" Org Mode
Plugin 'jceb/vim-orgmode'

" Color Schemes
Plugin 'jellybeans.vim'
Plugin 'altercation/vim-colors-solarized'

" Sudo on *nix
Plugin 'SudoEdit.vim'

" HTML
Plugin 'mattn/emmet-vim'

" JavaScript
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Code Format
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer autopep8
augroup END

call vundle#end()
call glaive#Install()

filetype plugin indent on

colorscheme solarized
if has('gui_running')
    set background=light
else
    set background=dark
endif
