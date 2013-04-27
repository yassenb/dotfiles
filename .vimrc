" general options
set nocompatible " makes Vim not compatible with Vi (usable)
set ruler " show the cursor position all the time
set hlsearch " highlight matches when searching
set nowrap " no wrapping for long lines
set number " show line numbers
set smartindent " automatically indents based on file syntax
set autoindent " autoindents when continuing on a new line
set tabstop=4 " number of spaces a tab stands for
set shiftwidth=4 " default indentation size
set shiftround " round indent to a multiple of shiftwidth
set expandtab " convert tabs to spaces on input
set ignorecase " when searching ignore case
set smartcase " when searching guess whether it's case sensitive based on whether there are capitals
set wildmode=longest,full " BASH like autocompletion
set backspace=indent,eol,start " for a normal backspace in insert mode
set nobackup " don't create backup files
set encoding=utf-8 " set the encoding for displaying
set fileencodings=ucs-bom,utf-8,cp1251 " set the encoding for writing files
set tabpagemax=100 " max number of tabs
set printoptions=header:0 " don't print file header when printing
set hidden " allow switching buffers without having to save
set undofile " save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set 	list
set listchars=tab:▸\ 

" add support for switching to cyrillic inside vim with C-^ and then set the default back to english
set keymap=bulgarian-phonetic
set iminsert=0
set imsearch=-1

" gui options
set mouse=a " in many terminal emulators the mouse works just fine, thus enable it
set guioptions-=T " hide the toolbar
set guioptions+=b " horizontal scroll

syntax on " enable syntax highlighting
filetype plugin indent on " smart indent based on file type
autocmd BufNewFile,BufRead *.json set filetype=javascript " enable syntax highlighting for JSON
" a line should be no longer than 120 symbols (including <LF>)
autocmd FileType ruby,python,javascript,java,cpp,haml,coffee setlocal textwidth=119
autocmd FileType coffee setlocal shiftwidth=2
autocmd BufEnter * set colorcolumn=+1 " display a print margin that corresponds to 'textwidth'
autocmd BufRead,BufNewFile *.iced setfiletype coffee

colorscheme desert
highlight ColorColumn guibg=darkgrey

" takes care of the terminal encoding
if &termencoding == ""
  let &termencoding = &encoding
endif

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" highlight extra spaces at end of lines
highlight ExtraWhitespace guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+\%#\@<!$/

" plug-in options

runtime macros/matchit.vim " smarter matching with % (ifs, elses...)

" ----------
" Bundle
" ----------

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"

Bundle "scrooloose/nerdtree"
Bundle "scrooloose/nerdcommenter"
Bundle "gregsexton/MatchTag"
Bundle "tpope/vim-surround"
Bundle "kien/ctrlp.vim"
Bundle "guns/vim-clojure-static"
Bundle "tpope/vim-foreplay"
Bundle "kchmck/vim-coffee-script"
Bundle "sickill/vim-pasta"
Bundle "tpope/vim-repeat"
Bundle "Raimondi/delimitMate"
Bundle "ervandew/supertab"
Bundle "tpope/vim-fugitive"

filetype plugin indent on

" NERD commenter
let NERDSpaceDelims=1 " put spaces around comment delimiters

" CtrlP
let g:ctrlp_open_new_file = "r" " open newly created files in the same window
" open multiple files as hidden buffers and switch to the last opened
let g:ctrlp_open_multiple_files = "1vj"
let g:ctrlp_custom_ignore = '\v\/(\.git|node_modules)$'

" delimitMate
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1

" supertab
" let g:SuperTabDefaultCompletionType = "context"

" mappings
let mapleader = ","

map <Space> :

map <C-w> :bdelete<CR>
imap <C-w> <C-o>:bdelete<CR>
map <C-Tab> :wincmd w<CR>

map <C-h> :nohlsearch<CR>

imap <C-h> <C-o>h
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-l> <C-o>l
map <C-j> <C-e>
map <C-k> <C-y>

" some sane editor mappings for frequently used functionality
map <C-s> :update<CR>
imap <C-s> <C-o>:update<CR>
map <C-c> "+y
imap <C-c> <C-o>"+y
noremap vv <C-v>
map <C-v> "+p
imap <C-v> <Esc>"+pa
cmap <C-v> <C-r>+
map <Home> ^
imap <Home> <C-o>^

" NERD commenter
map <Leader>/ <Leader>c<space>

" CtrlP
map <C-n> :CtrlPBuffer<CR>

" NERD Tree
map <F2> :NERDTreeToggle<CR>
