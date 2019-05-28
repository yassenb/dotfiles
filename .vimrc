" general options
set nocompatible " makes Vim not compatible with Vi (usable)
set ruler " show the cursor position all the time
set hlsearch " highlight matches when searching
set nowrap " no wrapping for long lines
set number " show line numbers
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
set noswapfile " don't create swap files
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
" this allows for normal mode mappings to work when the layout is switched to cyrillic from the OS
set langmap+=чявертъуиопшщасдфгхйклзьцжбнмЧЯВЕРТЪУИОПШЩАСДФГХЙКЛЗѝЦЖБНМ;`qwertyuiop[]asdfghjklzxcvbnm~QWERTYUIOP{}ASDFGHJKLZXCVBNM,ю\\,Ю\|,

" gui options
set mouse=a " in many terminal emulators the mouse works just fine, thus enable it
set guioptions-=T " hide the toolbar
set guioptions+=b " horizontal scroll
set laststatus=2 " always display the statusline

syntax on " enable syntax highlighting
filetype plugin indent on " smart indent based on file type
autocmd BufNewFile,BufRead *.json set filetype=javascript " enable syntax highlighting for JSON
" a line should be no longer than 120 symbols (including <LF>)
autocmd FileType ruby,python,javascript,java,cpp,haml,coffee setlocal textwidth=119
autocmd FileType coffee,ruby,html.handlebars setlocal shiftwidth=2
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

Plugin 'gmarik/vundle'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'gregsexton/MatchTag'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'sickill/vim-pasta'
Plugin 'tpope/vim-repeat'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-endwise'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-eunuch'
Plugin 'AndrewRadev/sideways.vim'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'AndrewRadev/switch.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/bufkill.vim'
Plugin 'tpope/vim-rails'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-projectionist'
Plugin 'AndrewRadev/ember_tools.vim'
Plugin 'mileszs/ack.vim'
Plugin 'w0rp/ale'

filetype plugin indent on

" NERD commenter
let NERDSpaceDelims=1 " put spaces around comment delimiters

" CtrlP
let g:ctrlp_open_new_file = "r" " open newly created files in the same window
" open multiple files as hidden buffers and switch to the last opened
let g:ctrlp_open_multiple_files = "1vj"
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
let g:ctrlp_root_markers = ['build.gradle', '.gitignore', '.git']
let g:ctrlp_user_command={
    \ 'types': {
    \   1: ['.git', 'cd %s && git ls-files . -co --exclude-standard'],
    \   2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
    \ 'fallback': 'ag %s -l --nocolor -g ""'
    \ }

" delimitMate
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1

" supertab
" let g:SuperTabDefaultCompletionType = "context"

" airline
let g:airline#extensions#tabline#enabled = 1

" splitjoin
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
let g:splitjoin_normalize_whitespace = 1
let g:splitjoin_align = 1

" rspec-vim
let g:rspec_command = "!rspec --no-colour {spec}"

" Ack
let g:ackprg = 'ag --vimgrep'

" Ale
let g:ale_linters = {
\   'ruby': ['rubocop'],
\}
let g:ale_ruby_rubocop_executable = 'bundle'

" mappings
let mapleader = ","

map <Space> :

map <C-u> :BD<CR>
imap <C-u> <C-o>:BD<CR>
map <C-Tab> :wincmd w<CR>

map <Leader>h :nohlsearch \| cclose<CR>

map <CR> o<Esc>
map <S-CR> O<Esc>

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
map <Leader>f :NERDTreeFind<CR>

" sideways
nmap <C-h> :SidewaysLeft<cr>
nmap <C-l> :SidewaysRight<cr>
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

" splitjoin
nmap sj :SplitjoinJoin<CR>
nmap sk :SplitjoinSplit<CR>

" switch
nmap <Leader>s :Switch<CR>

" silver searcher
map <Leader>a :Ack! 

" rspec-vim
map <Leader>tf :call RunCurrentSpecFile()<CR>
map <Leader>tt :call RunNearestSpec()<CR>
map <Leader>tl :call RunLastSpec()<CR>
map <Leader>ta :call RunAllSpecs()<CR>

" Tabular
map <Leader>= :Tabular /
map <Leader>== :Tabular<CR>
