"
" Keith Smiley's (http://keith.so) vimrc, do with what you will
"
"

set nocompatible " This must be first, because it changes other options

filetype off " Required for Vundle setup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle bundles
" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Github repos user/repo
Bundle 'altercation/vim-colors-solarized'
Bundle 'ervandew/supertab'
Bundle 'evanmiller/nginx-vim-syntax'
Bundle 'godlygeek/tabular'
Bundle 'gregsexton/MatchTag'
Bundle 'itspriddle/vim-marked'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'msanders/cocoa.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'rking/ag.vim'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-pathogen'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/cpp.vim--Skvirsky'

" Vim script repos
Bundle 'a.vim'
Bundle 'IndexedSearch'

" Enable pathogen for plugin development
execute pathogen#infect('src/{}')

filetype plugin indent on " Re-enable after Vundle setup
syntax enable " Enable vim syntax highlighting as is (enable != on)

" http://stackoverflow.com/questions/10507344/get-vim-to-modify-the-file-instead-of-moving-the-new-version-on-it
" http://www.jamison.org/2009/10/03/how-to-fix-the-crontab-no-changes-made-to-crontab-error-using-vim-in-linux/
set backupcopy=yes             " Allow vim to write crontab files

set shortmess=I                " Disable the startup message
set shell=zsh                  " Set the default shell
set termencoding=utf-8         " Set the default encodings just in case $LANG isn't set
set encoding=utf-8             " Set the default encodings just in case $LANG isn't set
set autoindent                 " Indent the next line matching the previous line
set smartindent                " Smart auto-indent when creating a new line
set cursorline                 " highlight current line
set tabstop=2                  " Number of spaces each tab counts for
set shiftwidth=2               " The space << and >> moves the lines
set shiftround                 " Round << and >> to multiples of shiftwidth
set wildmenu                   " Better completion in the vim command line
set wildmode=longest,list,full " Completion settings
set expandtab                  " Insert spaces instead of actually tabs
set smarttab                   " Delete entire shiftwidth of tabs when they're inserted
set scrolloff=5                " The number of lines above and below
set history=1000               " The number of history items to remember
set undolevels=200             " The number of undo items to remember
set backspace=indent,eol,start " Backspace settings

" Fold settings
set nofoldenable               " Have all folds open by default
set foldnestmax=10             " Set deepest fold to x levels
set foldmethod=indent          " Decide where to fold based off syntax
set foldcolumn=2               " The width of the gutter column showing folds by line
" Toggle folds with the space bar
nnoremap <Space> za

let &titleold=getcwd() " On quit reset title

let hour = strftime("%H") " Set the background light from 7am to 7pm
if 7 <= hour && hour < 19
	set background=light
else " Set to dark from 7pm to 7am
	set background=dark
endif
colorscheme solarized " Use the awesome solarized color scheme

set ttyfast           " Set that we have a fast terminal
set noerrorbells      " Don't make noise
set visualbell        " Don't show bells
set autoread          " watch for file changes and auto update
set showmatch         " set show matching parenthesis
set matchtime=1       " The amount of time matches flash
set number            " Shows line numbers
set ruler             " Shows current cursor location
set nrformats-=octal  " Never use octal notation
set mouse=a           " enable using the mouse if terminal emulator
set hlsearch          " Highlight search terms
set incsearch         " Show searches as you type
set nolist            " Don't show invisible characters
set wrap              " Softwrap text
set linebreak         " Don't wrap in the middle of words
set ignorecase        " ignore case when searching
set smartcase         " ignore case if search is lowercase, otherwise case-sensitive
set title             " Change the terminal's title
set nobackup          " Don't keep backup files
set nowritebackup     " Don't create a backup when overwriting a file
set noswapfile        " Don't write swap files

" Quicker timeouts for tmux + vim + iTerm
set ttimeout
set timeoutlen=20
set notimeout

" Map home and end keys to the correct things
map <Home> gg
map <End>  G
map <PageUp> <C-b>
map <PageDown> <C-f>

" Reselect visual blocks after movement
vnoremap < <gv 
vnoremap > >gv

" GUI style indent movement
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Move as expected on wrapped lines
nnoremap j gj
vnoremap j gj
nnoremap <Down> gj
vnoremap <Down> gj
inoremap <Down> <C-o>gj

nnoremap k gk
vnoremap k gk
nnoremap <Up> gk
vnoremap <Up> gk
inoremap <Up> <C-o>gk


" Force root permission saves
cmap w!! %!sudo tee > /dev/null %

" Open vimrc with leader->v
nmap <leader>v  :tabedit $MYVIMRC<cr>
nmap <leader>sv :source $MYVIMRC<cr>

if has("clipboard")     " If the feature is available
	set clipboard=unnamed " copy to the system clipboard
endif

" Tab mappings
nmap <leader>tt :tabnew<cr>
nmap <leader>te :tabedit
nmap <leader>tc :tabclose<cr>
nmap <leader>to :tabonly<cr>
nmap <leader>tn :tabnext<cr>
nmap <C-tab>    :tabnext<cr>
nmap <C-S-tab>  :tabprevious<cr>
nmap <leader>tp :tabprevious<cr>
nmap <leader>tf :tabfirst<cr>
nmap <leader>tl :tablast<cr>
nmap <leader>tm :tabmove

" Using command shift brackets or command numbers to navigate tabs
map <D-S-]> gt
map <D-S-[> gT
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR>
 
" Using control shift brackets or control numbers to navigate tabs
map <C-S-]> gt
map <C-S-[> gT
map <C-1> 1gt
map <C-2> 2gt
map <C-3> 3gt
map <C-4> 4gt
map <C-5> 5gt
map <C-6> 6gt
map <C-7> 7gt
map <C-8> 8gt
map <C-9> 9gt


" Split window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Change the way splits open by default
set splitbelow
set splitright

" Press F4 to toggle highlighting on/off, and show current value.
" :noremap <F4> :set hlsearch! hlsearch?<CR>

" Remove the last search thus clearing the highlight
" This clears the search register denoted by @/
nnoremap <F4> :let @/ = ""<CR>

" http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
nnoremap <F2> :set invpaste paste?<CR> " Toggle paste in normal mode
set pastetoggle=<F2> " Toggle paste in insert mode
set showmode         " Display the mode when it changes

" Set specific filetypes to fold by syntax
autocmd Syntax c,cpp,ruby,rspec,vim,xml,xhtml setlocal foldmethod=syntax
autocmd Syntax c,cpp,ruby,rspec,vim,xml,xhtml,perl normal zR

autocmd FileType make setlocal tabstop=4 shiftwidth=4 noexpandtab
autocmd FileType sh setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType php setlocal tabstop=4 shiftwidth=4 noexpandtab

" Settings for podspecs
autocmd BufReadPost,BufWrite *.podspec setlocal filetype=ruby
autocmd BufReadPost,BufWrite Podfile setlocal filetype=ruby

" Make sure ObjC header files are treated properly
autocmd BufReadPost,BufNewFile *.h,*.m setlocal filetype=objc
autocmd BufReadPost *Test.m,*Tests.m setlocal filetype=specta

autocmd BufReadPost,BufNewFile *.com setlocal filetype=nginx
autocmd FileType markdown setlocal spell
autocmd FileType text setlocal spell

" a.vim ObjC settings
autocmd FileType objc let g:alternateExtensions_h = "m" 
autocmd FileType objc let g:alternateExtensions_m = "h"

" ObjC curly brace error fix
let c_no_curly_error = 1

" Cold Fusion correct comment type
autocmd FileType cf setlocal commentstring=<!---\ %s\ --->
autocmd FileType cpp setlocal commentstring=//\ %s
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType objc setlocal commentstring=//\ %s

" Remap W to w http://stackoverflow.com/questions/3878692/aliasing-a-command-in-vim
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))

" Powerline
set laststatus=2 " Always show the statusline
set t_Co=256     " Explicitly tell Vim that the terminal supports 256 colors

" CTRL-P
let g:ctrlp_show_hidden = 1

