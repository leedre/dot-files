syntax on
set fileformat=unix
set cursorline

" Automatic PlugIn installation
" Place before plug#begin() call
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/autoload')
Plug 'junegunn/goyo.vim'
Plug 'jacoborus/tender.vim'
Plug 'easymotion/vim-easymotion'
Plug 'michaeljsmith/vim-indent-object'

" Plug 'arcticicestudio/nord-vim'
call plug#end()

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Tender theme plugin
colorscheme tender

" Goyo Plugin toggle
map <leader>g :Goyo \| set linebreak<CR>

" Turns off bell sound
set visualbell

" Set splits to open to the right instead of bottom
set splitbelow splitright

" Sets relative numbers
set relativenumber

" shows number
set number

" affects what happens when you press the <TAB> key
set expandtab 

" insert "tabstop number of spaces when the <tab> key is pressed
set smarttab

" does the right thing (mostly) in programs
" changes the width of the TAB character
set tabstop=3

set smartindent

" does nothing more than copy the indentation from the previous line
" when starting a new line
set autoindent

" affects what happens when you press >> or << or ==
set shiftwidth=3

" Use <ENTER> key to create new lines in normal mode
nnoremap <CR> o<Esc>k

" Use [ and <space> to make new line
" nnoremap <silent> [<space>  :<c-u>put!=repeat([''],v:count)<bar>']+1<cr>
" nnoremap <silent> ]<space>  :<c-u>put =repeat([''],v:count)<bar>'[-1<cr>

" Inserts space in normal mode.
nnoremap <space> i<space><esc>

" ignore case when searching
set ignorecase

" enable search highlighting
set hlsearch

" Incremental search that shows partial matches
" Starts searching before pressing enter
set incsearch

" Automatically switch search to case-sensitive when search query contains an uppercase letter
set smartcase

" Always displays the status bar
" set laststatus=2

" Set the window's title, reflecting the file currently being edited
" set title

" Enable line wrapping
set wrap

" Avoid wrapping a line in the middle of a word
set linebreak

" Move to next window
map <Tab> <C-W>w
map <S-Tab> <C-W>p

" Redo with Shift + u instead of Ctrl + r
noremap U <C-R>

" Visual autocomplete for command menu
set wildmenu

" Enable autocompletion
set wildmode=longest,list,full

" Set F5 to spellcheck 
map <F5> :setlocal spell! spelllang=en_us<CR>

"--------------------------------------------------------------------
" Beginning of tpope's sensible plugin
"--------------------------------------------------------------------

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

" Incremental search that shows partial matches
" Starts searching before pressing enter
set incsearch

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Displays the status on the right side of the status line. By default
" the line, column, virtual column, and relative position
set ruler

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

set autoread

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options
set viewoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

if empty(mapcheck('<C-U>', 'i'))
  inoremap <C-U> <C-G>u<C-U>
endif
if empty(mapcheck('<C-W>', 'i'))
  inoremap <C-W> <C-G>u<C-W>
endif

" vim:set ft=vim et sw=2:

"--------------------------------------------------------------------
" End of tpope's sensible plugin
"--------------------------------------------------------------------
 
 
" Remaps ^ to B
nnoremap B ^

" Remaps g_ to E
nnoremap E g_

" Press <F9> while in insert mode to stops indenting when pasting with the mouse
set pastetoggle=<f9>

" remap jj to esc key
" inoremap jj <Esc>

" remap Capslock to Esc
" inoremap { {<CR>}<Esc>ko

" sets ?
"if &term == "screen"
"	set t_Co=256
"	endif


"-------------------------------------------------------------------------
" Commenting blocks of code.
"-------------------------------------------------------------------------

set nocompatible
filetype plugin on

autocmd FileType c,cpp,html inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
autocmd FileType c,cpp,html vnoremap <Space><Space> <Esc>/<++><Enter>"_c4l
autocmd FileType c,cpp,html map <Space><Space> <Esc>/<++><Enter>"_c4l

autocmd FileType c inoremap ,c /* */<Space><++><Esc>2F*a<Space>
autocmd FileType cpp inoremap ,c /* */<Space><++><Esc>2F*a<Space>

"-------------------------------------------------------------------------
" HTML vimrc
"-------------------------------------------------------------------------

autocmd FileType html inoremap ;b <b></b><Space><++><Esc>FbT>i
autocmd FileType html inoremap ;i <em></em><Space><++><Esc>FeT>i
autocmd FileType html inoremap ;1 <h1></h1><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ;2 <h2></h2><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ;3 <h3></h3><Enter><Enter><++><Esc>2kf<i
autocmd FileType html inoremap ;p <p></p><Enter><Enter><++><Esc>02kf>a
autocmd FileType html inoremap ;a <a<Space>href=""><++></a><Space><++><Esc>F"i
autocmd FileType html inoremap ;ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
autocmd FileType html inoremap ;li <Esc>o<li></li><Esc>F>a
autocmd FileType html inoremap ;ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
autocmd FileType html inoremap ;c <!----><Space><++><Esc>
autocmd FileType html inoremap ;d <div></div><Space><++><Esc>FdT>i

"-------------------------------------------------------------------------
"
