set nocompatible

set ruler  " show the cursor position all the time

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

syntax on  " syntax highlighting
set hlsearch  " highlight matches when searching

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

set nowrap  " no wrapping for long lines

set guioptions-=T  " hide the toolbar
set guioptions+=b  " horizontal scroll

set number  " show line numbers

colorscheme desert

if &termencoding == ""
  let &termencoding = &encoding
endif
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp1251
setglobal fileencoding=utf-8

" add support for switching to cyrillic inside vim with C-6 and then set the default back to english
set keymap=bulgarian-phonetic
set iminsert=0
set imsearch=-1

set smartindent
set autoindent
set ignorecase
set smartcase  " when searching guess whether it's case sensitive

set tabstop=4  " number of spaces a tab stands for
set shiftwidth=4  " default indentation size
set shiftround  " round indent to a multiple of shiftwidth
set expandtab  " convert tabs to spaces on input

filetype plugin indent on  " smart indent based on file type

set wildmode=longest,full  " BASH like autocompletion
set backspace=indent,eol,start  " for a normal backspace in insert mode
set nobackup

set tabpagemax=100  " max number of tabs

tab all  " when opening multiple files open them in tabs

let NERDSpaceDelims=1

set printoptions=header:0

" enable syntax highlighting for JSON
autocmd BufNewFile,BufRead *.json set ft=javascript

imap jk <Esc>
imap kj <Esc>

map <C-s> :update<CR>
imap <C-s> <C-o>:update<CR>
map <C-z> u 
imap <C-z> <C-o>u
map <C-y> <C-r> 
imap <C-y> <C-o><C-r>
map <C-c> "+y
imap <C-c> <C-o>"+y
noremap <C-q> <C-v>
inoremap <C-q> <C-o><C-v>
map <C-v> "+p
imap <C-v> <Esc>"+pa
cmap <C-v> <C-r>+
map <C-x> "+x
imap <C-x> <C-o>"+x

map <C-t> :tabnew<CR>
imap <C-t> <C-o>:tabnew<CR>
map <C-w> :q<CR>
imap <C-w> <C-o>:q<CR>
map <C-Tab> :tabnext<CR>
imap <C-Tab> <C-o>:tabnext<CR>
map <Home> ^
imap <Home> <C-o>^
map <C-h> :nohlsearch<CR>
imap <C-h> <C-o>:nohlsearch<CR>
map <C-e> ,c<space>
imap <C-e> <C-o>,c<space>

" tips:
"   set incsearch
