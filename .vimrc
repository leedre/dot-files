" start
syntax on
set fileformat=unix
set cursorline

" Change cursor shape in different modes
" I had to add this after changing iterm2 to vertical cursor line
" Must have set cursorline
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Finally fixed lag between mode change
" thanks to stackoverflow's post
set ttimeout
set ttimeoutlen=1
set ttyfast

set mouse=a             " Allows mouse scrolling
set scrolloff=99        " Keeps the current line in the middle when scroling and jumping through search results set clipboard=unnamed   " Yank and paste from vim to global clipboard
" g~w                   " Toggle case entire word

"================================================
"================ Macro remaps ==================
"================================================

" Exceute quicker macro or type @q without this remap.
" As a bonus, use @: to replay the last ex command. (And then that becomes the "last used macro" that can be repeated with @@.)
" Repeat macros by 4@q
nnoremap Q @q

" Enables @q in visual mode and paste macro at beginning of line
" vnoremap Q :normal! @q<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""e
""""""""""""""""" vim-plug """"""""""""""""""""""" 
""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin notes and trick
" reload .vimrc and :pluginstall to install plugin.
" PlugDiff
" PlugStatus
" PlugUpgrade
" PlugInstall
" PlugClean

" Automatic plugin installation
" Place before plug#begin() call
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -flo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/autoload')
Plug 'junegunn/goyo.vim'
Plug 'jacoborus/tender.vim'
Plug 'easymotion/vim-easymotion'
Plug 'michaeljsmith/vim-indent-object'
Plug 'lambdalisue/battery.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
" Plug 'justinmk/vim-sneak'
""""""""""""""""""""""""
"""""" Themes """"""""""
""""""""""""""""""""""""
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' 
Plug 'arcticicestudio/nord-vim'
Plug 'tomasiser/vim-code-dark'
call plug#end()

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" --------------------------------------------
" ----------- Color theme --------------------
" --------------------------------------------
" activate the theme by adding colorscheme <name-of-theme> 
" or change it on-the-fly by running :colorscheme <name-of-theme>
" Tender theme plugin
colorscheme tender

" vs code dark theme mode
" let g:airline_theme = 'codedark'
" colorscheme codedark

" --------------------------------------------
" ----------- Leader keys --------------------
" --------------------------------------------
" Map leader key to comma (,)
let mapleader = ","

" Quit with leader key shortcut
nnoremap <leader>q :q!<CR>
" Writes to buffer and changes modification time even if you changed nothing
" :x will not touch modification time and won't be re-saved
" if file was unchanged
nnoremap <leader>s :w<CR>

" Map Fuzzy Search
nmap <leader><leader>f :FZF<CR>

" --------------------------------------------
" -------------- Terminal ---------------------
" --------------------------------------------
" Enter terminal
nnoremap <leader>t :botright vertical terminal<CR>
nnoremap <leader><leader>t :terminal<CR>

" --------------------------------------------
" -----------   NERDTree ---------------------
" --------------------------------------------
" nnoremap <leader>ng :NERDTreeFocus<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
" nnoremap <leader>nf :NERDTreeFind<CR>
" nnoremap <leader>N :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>

"================================================
"=============== Buffer Remaps ==================
"================================================
map bn :bnext<cr>
map bp :bp<cr>
map bd :b#<cr>  
map bq :bw<cr>

" :vert sb N(buffer #)
" :vert belowright sb N(buffer #)
" or try :vsp | b1
map bv :vertical sb
map bs :sb

" Tab brings you to next buffer and shift-tab goes to previous buffer
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
" Map leader b to to show buffer
" Shows list of numbered open buffers and then type a number or name and
" press enter
nnoremap <leader>b :ls<CR>:b<Space>

" --------------------------------------------
" --------- Goyo Plugin toggle ---------------
" --------------------------------------------
map <leader>g :Goyo \| set linebreak<CR>

" --------------------------------------------
" ------------- gitgutter ----- --------------
" --------------------------------------------
" You can explicitly turn vim-gitgutter off and on (defaults to on):

" turn off with :GitGutterDisable
" turn on with :GitGutterEnable
" toggle with :GitGutterToggle.
" To toggle vim-gitgutter per buffer:

" turn off with :GitGutterBufferDisable
" turn on with :GitGutterBufferEnable
" toggle with :GitGutterBufferToggle
" You can turn the signs on and off (defaults to on):

" turn on with :GitGutterSignsEnable
" turn off with :GitGutterSignsDisable
" toggle with :GitGutterSignsToggle.
" And you can turn line highlighting on and off (defaults to off):

" turn on with :GitGutterLineHighlightsEnable
" turn off with :GitGutterLineHighlightsDisable
" toggle with :GitGutterLineHighlightsToggle.

" --------------------------------------------
" ------------- tpope Surround  --------------
" --------------------------------------------
"It's easiest to explain with examples. Press cs"' inside

""Hello world!"
"to change it to

"'Hello world!'
"Now press cs'<q> to change it to

"<q>Hello world!</q>
"To go full circle, press cst" to get

""Hello world!"
"To remove the delimiters entirely, press ds".

"Hello world!
"Now with the cursor on "Hello", press ysiw] (iw is a text object).

"[Hello] world!
"Let's make that braces and add some space (use } instead of { for no space): cs]{

"{ Hello } world!
"Now wrap the entire line in parentheses with yssb or yss).

"({ Hello } world!)
"Revert to the original text: ds{ds)

"Hello world!
"Emphasize hello: ysiw<em>

"<em>Hello</em> world!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" incsearch easymotion""""""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)

" incsearch.vim x fuzzy x vim-easymotion
" function! s:config_easyfuzzymotion(...) abort
"   return extend(copy({
"   \   'converters': [incsearch#config#fuzzy#converter()],
"   \   'modules': [incsearch#config#easymotion#module()],
"   \   'keymap': {"\<CR>": '<Over>(easymotion)'},
"   \   'is_expr': 0,
"   \   'is_stay': 1
"   \ }), get(a:, 1, {}))
" endfunction

" noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""" incsearch pluging """"""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)

" <Plug>(incsearch-stay) doesn't move the cursor
" map g/ <Plug>(incsearch-stay)

" Enable search highlighting
set hlsearch

" :h g:incsearch#auto_nohlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""" Vim airline""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:airline#extensions#tabline#formatter = 'default'
" Additionally, assign 1 to corresponding variables to immediately reflect the
" changes to statusline or tabline.let g:battery#update_tabline = 1
" For tabline.  let g:battery#update_statusline = 1 " For statusline.

" That'll display whitespace chars. You can toggle it with :set invlist. 
set list          " Display unprintable characters f12 - switches
" :airlineToggleWhitespace
" To turn off the trailing whitespace check at startup, add to your vimrc:
" Adds a unicode circle icon in bottom right
" let g:airline_section_z = '◉ ␤ % %l/%c'

let g:airline#extensions#whitespace#enabled = 0
" Displays white list as circle icon during insert mode, but turned it off
" because it was distracting
" set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping
let g:airline_powerline_fonts = 1
set statusline=%{battery#component()}
set tabline=%{battery#component()}
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
" let g:airline_theme='angr'
" set lighline theme inside lightline config
" let g:lightline = { 'colorscheme': 'angr' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""  Vim motion leader keys """""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searches words
" map <leader>f <Plug>(easymotion-w)
" Searches characters with bi-direction
map <leader>c <Plug>(easymotion-s)
" Searches words with bi-direciton
map <leader>f <Plug>(easymotion-bd-w)
" map <leader>F <Plug>(easymotion-b)
" Searches first lines
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""" Vim Object Indentation """""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vii selects all lines at the same indentation level as the current line.
" vii (goes into visual mode and selects the body of a try clause), ii (widens the selection to the entire method), ii (widens the selection again, to the entire class body), ii (widens the selection to also include the class signature). after this, further ii’s start selecting lines and blocks above the class.
" vai selects an indentation level and both the unindented line above and the unindented line below it
" vai selects all lines at the same indentation level as the current line, and the first unindented line above the indented block (e.g. the method signature, if the indented
"
" you can combine the ai, ii and ai text objects with other operators besides v for visual mode, e.g. cii, dii, yii etc. for example >ii or <ii will indent or dedent an indented block. if you have vim-commentary installed then gcii will comment out an indented block.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""" Vim Commentary """""""""""""""""""""" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-commentarty installed in tpope vim/pack/tpope/
" Comment stuff out. Use gcc to comment out a line (takes a count), gc to comment out the target of a motion (for example, gcap to comment out a paragraph), gc in visual mode to comment out the selection, and gc in operator pending mode to target a comment. You can also use it as a command, either with a range like :7,17Commentary
" My favorite file type isn't supported!
" Relax! You just have to adjust 'commentstring':
" autocmd FileType apache setlocal commentstring=#\ %s
" Comment stuff out. Use gcc to comment out a line (takes a count), gc to comment out the target of a motion (for example, gcap to comment out a paragraph), gc in visual mode to comment out the selection, and gc in operator pending mode to target a comment. You can also use it as a command, either with a range like :7,17Commentary

" Turns off bell sound
set visualbell

" Set splits to open to the right instead of bottom
set splitbelow splitright

" Sets relative numbers
set relativenumber

" shows number
set number

" Custom functions to toggle relative numbers
" :call ToggleLineNumber()
function! ToggleRelativeNumber()
      set number
      set norelativenumber!
endfunction

map <leader>l :call ToggleRelativeNumber()<CR>

function! ToggleLine()
      set norelativenumber
      set nonumber!
endfunction

map <leader>,l :call ToggleLine()<CR>

" Multiple leader keys potential 
" let mapleader=","
" map <leader>n :set number<CR>
" let mapleader="-"
" map <leader>n :set nonumber<CR>

" affects what happens when you press the <TAB> key
set expandtab 

" insert "tabstop number of spaces when the <tab> key is pressed
set smarttab

" does the right thing (mostly) in programs
" changes the width of the TAB character
set tabstop=4

set smartindent

" does nothing more than copy the indentation from the previous line
" when starting a new line
set autoindent

" affects what happens when you press >> or << or ==
set shiftwidth=4

set softtabstop=4

" Use <ENTER> key to create new lines in normal mode
nnoremap <CR> o<Esc>

" No more holding shift + semicolon key to enter command mode
" Semicolon alone brings you to command mode
nnoremap ; : 
nnoremap ; : 

" Use [ and <space> to make new line
" nnoremap <silent> [<space>  :<c-u>put!=repeat([''],v:count)<bar>']+1<cr>
" nnoremap <silent> ]<space>  :<c-u>put =repeat([''],v:count)<bar>'[-1<cr>

" Inserts space in normal mode.
nnoremap <space> i<space><esc>

" ignore case when searching
set ignorecase

" Automatically switch search to case-sensitive when search query contains an uppercase letter
set smartcase

" Incremental search that shows partial matches
" Starts searching before pressing enter
set incsearch

" Farewell, nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>! This feature turns 'hlsearch' off automatically after searching-related motions.

" Removes highlights texts
map <leader>h :noh<CR>

" Always displays the status bar
" set laststatus=2

" Set the window's title, reflecting the file currently being edited
" set title

" Enable line wrapping
set wrap

" Avoid wrapping a line in the middle of a word
set linebreak

" Redo with Shift + u instead of Ctrl + r
noremap U <C-R>

" Visual autocomplete for command menu
" In insert mode Control-n and control-p to navigate forward and back
set wildmenu

" Ignores these when tab completing
set wildignore=*.o,*.obj.*~

" Enable autocompletion
" set wildmode=longest,list,full

" Makes commandline tab completion similar to bash
set wildmode=list:longest,full

" Set leader+5 to spellcheck 
" Navigate Spell check
" So you have all your misspellings highlighted…how do you fix them?
" Type <]s> to go to the next misspelled word (<[s> to go back). 
" If the word you are on is misspelled type <z=> and you will be 
" presented with a numbered list of words vim thinks you meant. 
" Type the corresponding number and hit enter and vim will fix the 
" word for you! Neat! (hit enter to exit the list without choosing a word)
"
" Add and remove words from dictionary
" What if vim is wrong? To add a word to your local dictionary 
" move the cursor over the incorrectly marked word and type <zg to 
" add it to your dictionary. If you do this by accident you can 
" type <zug> to undo. If you want vim to mark a word as misspelled 
" you can add it to your wrong word list by typing <zw> (zuw to undo).
map <leader>5 :setlocal spell! spelllang=en_us<CR>

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
" Allows backspace in insert mode
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

" Incremental search that shows partial matches
" Starts searching before pressing enter
set incsearch

" Use <C-L> to clear the highlighting of :set hlsearch.
" if maparg('<C-L>', 'n') ==# ''
"   nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
" endif

" Fast quit and save from normal and insert mode
" map <C-S> <ESC>:x<CR>
" imap <C-S> <ESC>:x<CR>

" Displays the status on the right side of the status line. By default
" the line, column, virtual, and relative position
set ruler

" Uncomment if scrolling page seems buggy
" if !&scrolloff
"   set scrolloff=1
" endif
" if !&sidescrolloff
"   set sidescrolloff=5
" endif
" set display+=lastline

" if &encoding ==# 'latin1' && has('gui_running')
"   set encoding=utf-8
" endif
set encoding=utf-8

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

" Yanks from the current position to end of matched word
nnoremap ye vg_y

" Yanks from current position to beginning of non blank character because of
" carrot sign
nnoremap yb vg^y 

" Deletes from current position to beginning of line
nnoremap db d0

" Deletes from current position to end of line
nnoremap de d$

" Press <F9> while in insert mode to stops indenting when pasting with the mouse
set pastetoggle=<f9>

" remap kj to esc key
" inoremap kj <Esc>

" remap Capslock to Esc
" inoremap { {<CR>}<Esc>ko

" sets ?
"if &term == "screen"
"	set t_Co=256
"	endif

"-------------------------------------------------------------------------
" Commenting blocks of code.
"-------------------------------------------------------------------------

" set nocompatible
" filetype plugin on

" autocmd FileType c,cpp,html vnoremap <Space><Space> <Esc>/<++><Enter>"_c4l
" autocmd FileType c,cpp,html map <Space><Space> <Esc>/<++><Enter>"_c4l

" autocmd FileType c inoremap ,c /* */<Space><++><Esc>2F*a<Space>
" autocmd FileType cpp inoremap ,c /* */<Space><++><Esc>2F*a<Space>


" Tpope vim commentarty plugin
" My favorite file type isn't supported!
" Relax! You just have to adjust 'commentstring':

" autocmd FileType apache setlocal commentstring=#\ %s

"-------------------------------------------------------------------------
" HTML vimrc
"-------------------------------------------------------------------------

" autocmd FileType html inoremap ;b <b></b><Space><++><Esc>FbT>i
" autocmd FileType html inoremap ;i <em></em><Space><++><Esc>FeT>i
" autocmd FileType html inoremap ;1 <h1></h1><Enter><Enter><++><Esc>2kf<i
" autocmd FileType html inoremap ;2 <h2></h2><Enter><Enter><++><Esc>2kf<i
" autocmd FileType html inoremap ;3 <h3></h3><Enter><Enter><++><Esc>2kf<i
" autocmd FileType html inoremap ;p <p></p><Enter><Enter><++><Esc>02kf>a
" autocmd FileType html inoremap ;a <a<Space>href=""><++></a><Space><++><Esc>F"i
" autocmd FileType html inoremap ;ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
" autocmd FileType html inoremap ;li <Esc>o<li></li><Esc>F>a
" autocmd FileType html inoremap ;ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
" autocmd FileType html inoremap ;c <!----><Space><++><Esc>
" autocmd FileType html inoremap ;d <div></div><Space><++><Esc>FdT>i

"-------------------------------------------------------------------------

" Exlorer splits to the right wheny add an exclamation mark
nnoremap <leader>e :Lex!<CR>

" Edit vimrc and source file
" nnoremap confe :e $MYVIMRC<CR>
" Reload vims configuration file
" nnoremap confr :source $MYVIMRC<CR>

" Leader mapping to source vimrc file
" nnoremap <leader>vt :e $MYVIMRC<CR>
" Reload vimrc configuration file
nnoremap <leader>S :source $MYVIMRC<CR>
"end
