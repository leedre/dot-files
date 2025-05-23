" Allow saving of files as sudo when I forgot to start vim using sudo.
" cmap w!! w !sudo tee > /dev/null %

" syntax enable will keep your current color settings
syntax enable

" syntax on if you want vim to overrule your settings with the default
syntax on
set fileformat=unix
set cursorline

" Change cursor shape in different modes
" I had to add this after changing iterm2 to vertical cursor line
" Must have set cursorline
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Toggles cursorline between normal and insert mode
autocmd InsertEnter,InsertLeave * set cul!

" Finally fixed lag between mode change
" thanks to stackoverflow's post
set ttimeout
set ttimeoutlen=1
set ttyfast

set mouse=a             " Allows mouse scrolling
" Minimal number of screen lines to keep above and below the cursor
" Keeps the current line in the middle when scroling and jumping through search results 
" set scrolloff=999
set clipboard=unnamed   " Yank and paste from vim to global clipboard
" Toggle case entire word
" g~w                   

"================================================
"================ Macro remaps ==================
"================================================

" Exceute quicker macro or type @q without this remap.
" As a bonus, use @: to replay the last ex command. (And then that becomes the last used macro that can be repeated with @@.)
" Repeat macros by 4@q
" nnoremap Q @q

" Enables @q in visual mode and paste macro at beginning of line
" vnoremap Q :normal! @q<CR>


"================================================
"================ Vim-Plug ==================

"
" Plugin notes and trick
" reload .vimrc and :pluginstall to install plugin.
" PlugDiff
" PlugStatus
" PlugUpgrade
" PlugInstall
" PlugClean

" Automatic plugin installation
" Place before plug#begin() call
call plug#begin('~/.vim/autoload')
Plug 'junegunn/goyo.vim'
Plug 'jacoborus/tender.vim'
Plug 'easymotion/vim-easymotion'
Plug 'michaeljsmith/vim-indent-object'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'luochen1990/rainbow'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Plug 'ThePrimeagen/harpoon'
" Plug 'justinmk/vim-sneak'
" Plug 'nvim-lua/plenary.nvim'
"
"================================================
" ==============Themes ==============
"================================================
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' 
Plug 'arcticicestudio/nord-vim'
Plug 'tomasiser/vim-code-dark'
Plug 'rakr/vim-one'
call plug#end()

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

"================================================
"============== Color theme =====================
"================================================
" activate the theme by adding colorscheme <name-of-theme> 
" or change it on-the-fly by running :colorscheme <name-of-theme>
" Tender theme plugin
" colorscheme tender
colorscheme one
set background=dark

" vs code dark theme mode
" let g:airline_theme = 'codedark'
" colorscheme codedark

"================================================

"================================================
" Remap <Control - r> to replace every word on current line
" nnoremap <C-l> :s///g<left><left><left>

" Change only whole words exactly matching 'foo' to 'bar'; ask for confirmation.
" :%s/\<foo\>/bar/gc
" Remap <Control - R> to replace all words in current file with confirmation
" nnoremap <leader>S :%s///gc<left><left><left><left>

" Find each occurrence of 'foo' (in all lines), and replace it with 'bar'.
" :%s/foo/bar/g

" Find each occurrence of 'foo' (in the current line only), and replace it with 'bar'.
" :s/foo/bar/g

" Change each 'foo' to 'bar', but ask for confirmation first.
" :%s/foo/bar/gc

"================================================
" ====---- Leader keys =========--
"================================================
" Map leader key to comma (,)
let mapleader = ","

" Quit with leader key shortcut
" Shortcut is ZQ
nnoremap <leader>q :q!<CR>

" Writes to buffer and changes modification time even if you changed nothing
" If you quit via :wq, the modification time will change as the file is
" technically rewritten.
" :x will not touch modification time and won't be re-saved
" if file was unchanged
nnoremap <leader>s :w<CR>

" Map Fuzzy Search
nmap <leader><leader>f :FZF<CR>

"================================================
" =======- Terminal =========---
"================================================
" Enter terminal
nnoremap <leader>t :botright vertical terminal<CR>
nnoremap <leader><leader>t :terminal<CR>

"================================================
" ====----   NERDTree =========---
"================================================
" nnoremap <leader>ng :NERDTreeFocus<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
" nnoremap <leader>nf :NERDTreeFind<CR>
" nnoremap <leader>N :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>

"================================================
"=============== Buffer Remaps ==================
"================================================
nnoremap <leader>d :bnext<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bd :bd<cr>  
nnoremap <leader>bx :bw<cr>

" :vert sb N(buffer #)
" :vert belowright sb N(buffer #)
" or try :vsp | b1
nnoremap <leader>bv :vertical sb
nnoremap <leader>bs :sb

" Tab brings you to next buffer and shift-tab goes to previous buffer
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
" Map leader b to to show buffer
" Shows list of numbered open buffers and then type a number or name and
" press enter
nnoremap <leader>bl :ls<CR>:b<Space>

" Amix vimrc starts
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Always show the status line
" set laststatus=2

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
"
" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
" nmap <M-j> mz:m+<cr>`z
" nmap <M-k> mz:m-2<cr>`z
" vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
" vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" if has("mac") || has("macunix")
"   nmap <D-j> <M-j>
"   nmap <D-k> <M-k>
"   vmap <D-j> <M-j>
"   vmap <D-k> <M-k>
" endif

" Remove the Windows ^M - when the encodings gets messed up
" noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
" map <leader>q :e ~/buffer<cr>
" Amix vimrc ends

"================================================
"=========== Goyo Plugin toggle =================
"================================================
nnoremap <leader>g :Goyo \| set linebreak<CR>

"================================================
"========== Vim Rainbow Toggle ==================
"================================================
nnoremap <leader>r :RainbowToggle<CR>
" Set to 0 if you want to enable it later with :RainbowToggle
" Set it always on
let g:rainbow_active = 1 

"================================================
"============== Git-Gutter ======================
"================================================
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

"================================================
"============== tpope Surround ==================
"================================================
"It's easiest to explain with examples. Press cs"' inside
" if you use the opening character - e.g.: (, { and [ - them it will include spaces. If you use the closing character - e.g.: ), } and ] - them it won't include spaces. The aliases for these blocks (b, B and r) also doesn't includes the spaces, probably because most of time the people (like you) doesn't want the spaces.
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

"================================================
"============== incsearch easymotion ============
"================================================
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
"=================================================
"============ incsearch plugin ===================
"=================================================
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)

" <Plug>(incsearch-stay) doesn't move the cursor
" map g/ <Plug>(incsearch-stay)

" Enable search highlighting as you search
set hlsearch
" highlight IncSearch guibg=green ctermbg=red term=underline
hi Search guibg=peru guifg=wheat
" hi Search cterm=NONE ctermfg=red ctermbg=NONE

hi QuickFixLine term=reverse ctermbg=52

" :h g:incsearch#auto_nohlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)


"================================================
" ============== Vim airline ====================
"================================================
" let g:airline#extensions#tabline#formatter = 'default'

" That'll display whitespace chars. You can toggle it with :set invlist. 
" set list          " Display unprintable characters f12 - switches
" :airlineToggleWhitespace
" To turn off the trailing whitespace check at startup, add to your vimrc:
" Adds a unicode circle icon in bottom right
" let g:airline_section_z = '◉ ␤ % %l/%c'

let g:airline#extensions#whitespace#enabled = 0
" Displays white list as circle icon during insert mode, but turned it off
" because it was distracting
" set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline_theme='base16'
" let g:airline_theme='raven'
let g:airline_theme='hybrid'


"================================================
" ===========Vim motion leader keys =============
"================================================
" Searches words
" map <leader>f <Plug>(easymotion-w)
" Searches characters with bi-direction
map <leader>f <Plug>(easymotion-s)
" Searches words with bi-direciton but it was too messy
" map <leader>f <Plug>(easymotion-bd-w)
" map <leader>F <Plug>(easymotion-b)
" Searches first lines
" map <leader>j <Plug>(easymotion-j)
" map <leader>k <Plug>(easymotion-k)


"================================================
" ========= Vim Object Indentation ==============
"================================================
" vii selects all lines at the same indentation level as the current line.
" vii (goes into visual mode and selects the body of a try clause), ii (widens the selection to the entire method), ii (widens the selection again, to the entire class body), ii (widens the selection to also include the class signature). after this, further ii’s start selecting lines and blocks above the class.
" vai selects an indentation level and both the unindented line above and the unindented line below it
" vai selects all lines at the same indentation level as the current line, and the first unindented line above the indented block (e.g. the method signature, if the indented
"
" you can combine the ai, ii and ai text objects with other operators besides v for visual mode, e.g. cii, dii, yii etc. for example >ii or <ii will indent or dedent an indented block. if you have vim-commentary installed then gcii will comment out an indented block.

"================================================
" ============Vim Commentary ================ 
"================================================
" vim-commentarty installed in tpope vim/pack/tpope/
" Comment stuff out. Use gcc to comment out a line (takes a count), gc to comment out the target of a motion (for example, gcap to comment out a paragraph), gc in visual mode to comment out the selection, and gc in operator pending mode to target a comment. You can also use it as a command, either with a range like :7,17Commentary
" My favorite file type isn't supported!
" Relax! You just have to adjust 'commentstring':
" autocmd FileType apache setlocal commentstring=#\ %s
" Comment stuff out. Use gcc to comment out a line (takes a count), gc to comment out the target of a motion (for example, gcap to comment out a paragraph), gc in visual mode to comment out the selection, and gc in operator pending mode to target a comment. You can also use it as a command, either with a range like :7,17Commentary

" Turns off bell sound
" Error bells are displayed visually
set visualbell

" Set splits to open to the right instead of bottom
set splitbelow splitright

" Sets relative numbers
set relativenumber

" shows number
set number

" Sets 7 lines to the cursor when moving vertically with j & k
" set so=7

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

" affects what happens when you press the <TAB> key
set expandtab 

" insert "tabstop number of spaces when the <tab> key is pressed
set smarttab

" does the right thing (mostly) in programs
" changes the width of the TAB character
set tabstop=4

" automatically indent when adding a curly bracket
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

" Repeat previous command by holding shift and semicolon
nnoremap : ;
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
" Search as you type
set incsearch

" show editing mode
set showmode

" Farewell, nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>! This feature turns 'hlsearch' off automatically after searching-related motions.

" Removes highlights texts
" map <leader>h :noh<CR>
nnoremap <silent> <leader>h :noh<CR>

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

" Searches files and all subfolders in vim commands 
set path+=**

" Ignores these when tab completing
set wildignore=*.o,*.obj.*~
set wildignore=+=**/node_modules/**

" Enable autocompletion
" set wildmode=longest,list,full

" Makes commandline tab completion similar to bash
set wildmode=list:longest,full

" A buffer is hidden when it is abandoned
" set hidden

" Show matching brackets
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Autocomplete
" Use simple ctrl and space instead of ctrl-x and ctrl-o to key combination
" doesn't seem to work tho. Default is ctrl-o and ctrl-p
" imap <C-Space> <C-x><C-o>
"
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

"=======================================
" Beginning of tpope's sensible plugin
"=======================================

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
" set smarttab this is a duplicate

set nrformats-=octal

" Use <C-L> to clear the highlighting of :set hlsearch.
" if maparg('<C-L>', 'n') ==# ''
"   nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
" endif

" Fast quit and save from normal and insert mode
" map <C-S> <ESC>:x<CR>
" imap <C-S> <ESC>:x<CR>

" Displays the status on the right side of the status line. By default
" the line, column, virtual, and relative position
" Show line number and cursor position
set ruler

" Displayif incomplete commands
set showcmd

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
" if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
"   runtime! macros/matchit.vim
" endif

" if empty(mapcheck('<C-U>', 'i'))
"   inoremap <C-U> <C-G>u<C-U>
" endif
" if empty(mapcheck('<C-W>', 'i'))
"   inoremap <C-W> <C-G>u<C-W>
" endif

" vim:set ft=vim et sw=2:

"==================================-
" End of tpope's sensible plugin
"==================================-
 
" Remaps ^ to B
nnoremap B ^

" Remaps g_ to E
nnoremap E g_

" Yanks from the current position to end of matched word
nnoremap ye vg_y

" Change (replace) to end of line
nnoremap cE c$

" Yanks from current position to beginning of non blank character because of
" carrot sign
nnoremap yb vg^y 

" Deletes from current position to beginning of line
nnoremap db d0

" Deletes from current position to end of line
nnoremap de d$

"==================================-
" Start of ThePrimeagen vimrc
"==================================-
"

"When writing to underscore or (_) register, nothing happens. This can be used to delete text without affecting the normal registers
"Simply put it's deleting without yanking
" nnoremap("<leader>p", "\"_dP")
" nnoremap("<leader>y", "\"+y")
" nnoremap("<leader>Y", "\"+Y)

nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("n", "nzzv")
nnoremap("N", "Nzzv")
nnoremap("g;", "g;zz")
"
"==================================-
" End of ThePrimeagen vimrc
"==================================-
"
" Paste the line on a new line after the current one
" Works fine without it
" noremap <leader>p o<ESC>p

" Press <F9> while in insert mode to stops indenting when pasting with the mouse
" set pastetoggle=<f9>
" Toggle paste mode on and off (from amix vimrc)
nnoremap <leader>P :setlocal paste!<CR>

" Surround the visual selection in parenthesis/brackets (modified amix's
" vimrc)
" vnoremap $1 <esc>`>a)<esc>`<i(<esc>
" vnoremap $2 <esc>`>a]<esc>`<i[<esc>
" vnoremap $3 <esc>`>a}<esc>`<i{<esc>
" vnoremap $$ <esc>`>a"<esc>`<i"<esc>
" vnoremap $q <esc>`>a'<esc>`<i'<esc>
" vnoremap $e <esc>`>a`<esc>`<i`<esc>
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" remap kj to esc key
" inoremap kj <Esc>

" remap Capslock to Esc
" inoremap { {<CR>}<Esc>ko

" sets ?
"if &term == "screen"
"	set t_Co=256
"	endif

"=====================================
" Commenting blocks of code.
"=====================================

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

"=====================================
" HTML vimrc
"=====================================

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

"=====================================

" Exlorer splits to the right wheny add an exclamation mark
nnoremap <leader>e :Lex!<CR>

" Edit vimrc and source file
" nnoremap <leader>vt :e $MYVIMRC<CR>
" Reload vimrc configuration file
nnoremap <leader><leader>s :source $MYVIMRC<CR>
"end

" Source Vim configuration file and install/update vim plugins
" nnoremap <silent><leader><leader>p :source ~/.vimrc \| :PlugInstall<CR>
