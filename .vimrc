" general options
set nocompatible " makes Vim not compatible with Vi (usable)
set ruler " show the cursor position all the time
set hlsearch " highlight matches when searching
set nowrap " no wrapping for long lines
set number " show line numbers
set smartindent " automatically indents based on file syntax
set autoindent " autoindents when continuing on a new line
set tabstop=4  " number of spaces a tab stands for
set shiftwidth=4  " default indentation size
set shiftround  " round indent to a multiple of shiftwidth
set expandtab  " convert tabs to spaces on input
set ignorecase " when searching ignore case
set smartcase  " when searching guess whether it's case sensitive based on whether there are capitals
set wildmode=longest,full  " BASH like autocompletion
set backspace=indent,eol,start  " for a normal backspace in insert mode
set nobackup " don't create backup files
set encoding=utf-8 " set the encoding for displaying
set fileencodings=ucs-bom,utf-8,cp1251 " set the encoding for writing files
set tabpagemax=100  " max number of tabs
set printoptions=header:0 " don't print file header when printing

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
tab all " when opening multiple files open them in tabs
autocmd BufNewFile,BufRead *.json set ft=javascript " enable syntax highlighting for JSON

colorscheme desert

" takes care of the terminal encoding
if &termencoding == ""
  let &termencoding = &encoding
endif

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" plug-in options

" ----------
" Bundle
" ----------

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"

Bundle "scrooloose/nerdtree"
Bundle "scrooloose/nerdcommenter"

filetype plugin indent on

" NERD commenter
let NERDSpaceDelims=1 " put spaces around comment delimiters

" mappings
imap jj <Esc>
let mapleader = ","

" easy interaction with the clipboard
map <C-s> :update<CR>
imap <C-s> <C-o>:update<CR>
map <C-c> "+y
imap <C-c> <C-o>"+y
noremap vv <C-v>
map <C-v> "+p
imap <C-v> <Esc>"+pa
cmap <C-v> <C-r>+

map <C-t> :tabnew<CR>
imap <C-t> <C-o>:tabnew<CR>
map <C-w> :q<CR>
imap <C-w> <C-o>:q<CR>
map <Home> ^
imap <Home> <C-o>^
map <C-h> :nohlsearch<CR>
imap <C-h> <C-o>:nohlsearch<CR>

" NERD commenter
map <Leader>/ <Leader>c<space>
