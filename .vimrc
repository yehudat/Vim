"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HELP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"""""""""""""""""""""
" HOW TO FOLD CODE?
"""""""""""""""""""""
" zm to fold more
" zr to fold less
" zc to close a fold
" zo to open it
" za to toggle between those two states
" zM to close every fold
" zR to open them
"""""""""""""""""""""
" HOW TO SCROLL CODE?
"""""""""""""""""""""
" Move a line to the top/bottom of the screen: zt/zb
" Move half screen forward/back:             : <C-u>/<C-d>
"""""""""""""""""""""
" HOW TO ACCESS REGS?
"""""""""""""""""""""
" Print all the registers and its content:
"     Command mode: :reg
" Access a reg
"     Normal mode: press "<reg-key>
"     Insert mode: press <C-r> <reg-key>
" Example:
"     Copy a line to reg '2'          : (in Normal Mode)  "2yy
"     Copy an entire buffer to reg '+': (in Normal Mode)  gg"+yG
"     Copy an entire buffer to reg 'c': (in Command Mode) :%y c
"""""""""""""""""""""
" HOW TO MANAGE WINDOWS?
"""""""""""""""""""""
" <C-w>s : horisontal split
" <C-w>v : vertical   split
"""""""""""""""""""""
" VIM native indentations tools
"""""""""""""""""""""
" gg=G    indent all the lines in a file
" =i{     indent inside a block that starts with '{'
"""""""""""""""""""""
" VIM native marks
" [A-Z] global makrs
" [a-z] local file marks
" y'<mark_letter> copy from a cursor to a mark
" d'<mark_letter> delete from a cursor to a mark
"""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Enable UTF-8 special characters for 'list'/hidden characters feature
scriptencoding utf-8
set encoding=utf-8

"""""""""""""""""""""""""""""""""""""
"   Vundle installation & plugins   "
"""""""""""""""""""""""""""""""""""""
set nocompatible " be iMproved, required
filetype off     " required
let mapleader = "\<Space>"

if has('gui_running')
    "Removes windows to pop-up and removes the RHS scroll bar
    set guioptions+=lrbmTLce
    set guioptions-=lrbmTLce
    set guioptions+=c

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim

    " All plugins must be added between vundle#begin/end
    call vundle#begin()

    " :PluginInstall     - install a plugin
    " :PluginUpdate      - update existing plugin
    " :PluginClean       - uninstall a plugin
    Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required

    " Install the next plug-ins:
    Plugin 'NLKNguyen/papercolor-theme'      " colorscheme
    Plugin 'powerline/powerline-fonts'       " go to /home/yehudat/.vim/bundle/powerline-fonts and run install.sh to install the fonts
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'  " https://github.com/vim-airline/vim-airline/wiki/Screenshots
    Plugin 'vim-scripts/matchit.zip'
    Plugin 'nachumk/systemverilog.vim'
    Plugin 'vim-scripts/mru.vim'             " :MRU
    Plugin 'vim-scripts/ctags.vim'           " exuberant tags
    Plugin 'elzr/vim-json'                   " https://github.com/elzr/vim-json
    Plugin 'Townk/vim-autoclose'             " auto-closes brackets and paratheses
    Plugin 'scrooloose/nerdcommenter'        " in normal mode press <num_of_lines><Leader>cc or <num_of_lines><Leader>cu to uncomment
    Plugin 'junegunn/vim-easy-align'         " https://github.com/junegunn/vim-easy-align
    Plugin 'scrooloose/nerdtree'             " https://github.com/scrooloose/nerdtree
    Plugin 'Xuyuanp/nerdtree-git-plugin'
    Plugin 'majutsushi/tagbar'               " press <Shift-t>
    Plugin 'ctrlpvim/ctrlp.vim'              " https://github.com/kien/ctrlp.vim
    Plugin 'vimtaku/hl_matchit.vim'          " extends the existing functionality of % key
    Plugin 'airblade/vim-gitgutter'          " :GitGutterDisable/Enable | :GitGutterLineHighlightsDisable/Enable
    Plugin 'othree/xml.vim'
    Plugin 'tpope/vim-fugitive'              " Git wrapper for VIM: see more https://github.com/tpope/vim-fugitive
    Plugin 'Yggdroot/indentLine'             " https://github.com/Yggdroot/indentLine   :IndentLinesToggle
    Plugin 'michaeljsmith/vim-indent-object' " Text-object recognition of indented objects
    Plugin 'tpope/vim-surround'              " Cmd structure: {y,c,d}s<text-object>
    "Plugin 'Valloric/YouCompleteMe'          "https://github.com/Valloric/YouCompleteMe Installation: cd ~/.vim/bundle/YouCompleteMe; install.py --clang-completer
    "Plugin 'vim-syntastic/syntastic'         "https://github.com/vim-syntastic/syntastic

    call vundle#end()                        " required

    runtime macros/matchit.vim

    " Enable filetype plugins
    filetype plugin indent on

    set showtabline=2  "2-stand for 'always'
    set laststatus=2   "2-stand for 'always'

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Airline panel legend
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "+-----------------------------------------------------------------------------+
    "| A | B |                     C                            X | Y | Z |  [...] |
    "+-----------------------------------------------------------------------------+
    "Section    Meaning (example)
    "      A    displays the mode + additional flags like crypt/spell/paste (INSERT)
    "      B    VCS information (branch, hunk summary) (master)
    "      C    filename + read-only flag (~/.vim/vimrc RO)
    "      X    filetype (vim)
    "      Y    file encoding[fileformat] (utf-8[unix])
    "      Z    current position in the file
    "  [...]    additional sections (warning/errors/statistics) from external plugins (e.g. YCM, syntastic, ...)
    let g:airline_theme='solarized'
    let g:airline_solarized_bg='dark'
    let g:airline_section_z = '%p%% Ln:%l/Cn:%v'

    let g:airline#extensions#tabline#enabled = 1              "Tabline confuguration
    let g:airline#extensions#tabline#fnamemod = ':t'          "clean filename
    let g:airline#extensions#tabline#show_close_button = 0    "No 'X' close button

    "Powerline Glyphs
    let g:airline_powerline_fonts = 1

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Git Gutter
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let g:gitgutter_max_signs = 700
    let g:gitgutter_map_keys  = 0
    set updatetime=250
    " maps next/previous hunk of Git related code to ]h & [h
    nmap ]h <Plug>GitGutterNextHunk
    nmap [h <Plug>GitGutterPrevHunk
    " maps preview/stage/undo
    nmap <Leader>ha <Plug>GitGutterStageHunk
    nmap <Leader>hr <Plug>GitGutterUndoHunk
    nmap <Leader>hv <Plug>GitGutterPreviewHunk

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Ctags
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " search for definitions in tag list (of methods/modules/..)
    set tags=$VERIF_PROJ_HOME/.repo/tags
    nmap <C-d> <C-]>

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Syntastic
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 0
    let g:syntastic_check_on_wq = 1
    autocmd FileType c let g:syntastic_c_checkers = (finddir('HAL', '.;') == '') ? [''] : ['checkpatch']
    let g:syntastic_c_checkpatch_args = "--max-line-length=100"
    let g:syntastic_c_checkpatch_exec = "$HAL_TOP/checkpatch/checkpatch.pl"
    "Use to match begin end
    let g:hl_matchit_enable_on_vim_startup = 1

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "vim-easy-align
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Example for delimeter '=' :
    "       =  Around the 1st occurrences
    "      2=  Around the 2nd occurrences
    "      *=  Around all occurrences
    "      -=  Around last occurrence
    "     **=  Left/Right alternating alignment around all occurrences
    " <Enter>  Switching between left/right/center alignment modes
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "NERDTree (COMMENTED OUT DUE TO A HIGH PERF PENALTY/USAGE RATIO)
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    map <Leader>nt :NERDTreeToggle<CR>

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Tagbar
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let g:tagbar_width = 50
    let g:tagbar_compact = 1 "No help & blank lines
    "TagBar pane
    nmap <Leader>tt :TagbarToggle<CR>

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "CtrlP
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "<C-j/k> up/down the list
    "<C-v/s> open horizontal/vertial split
    "<C-z>   mark file to open multiple files at once
    "<C-o>   open files marked with <C-z>
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let g:ctrlp_use_caching = 0
    let g:ctrlp_custom_ignore = 'bin$\|build$\|node_modules$\|.git|.bak|.swp|.pyc|.class'
    "CtrlP will set its local working directory according to this variable
    " 'r' - the nearest ancestor that contains one of these directories or
    "       files: .git .hg .svn .bzr _darcs, and your own root markers
    "       defined with the g:ctrlp_root_markers option.
    " 'a' - like 'c', but only applies when the current working directory
    "       outside of CtrlP isn't a direct ancestor of the directory of
    "       the current file.
    let g:ctrlp_working_path_mode = 'ra'
    "To disable the feature above uncomment the next line and comment the line above
    "let g:ctrlp_working_path_mode = 0
    "Use regex instead of string as a sreach option - by default
    let g:ctrlp_regexp = 1
    let g:ctrlp_max_files=0
    let g:ctrlp_max_height = 18
    "Jump to a file if open in one of the windows instead of opening a new instance
    let g:ctrlp_switch_buffer = 'E'
    " Shortcuts
    nnoremap <Leader>ff :CtrlP<CR>
    nnoremap <Leader>fb :CtrlPBuffer<CR>
    nnoremap <Leader>ft :CtrlPTag<CR>
    " Buffer delete
    nnoremap <Leader>bd :bd<CR>
    " Buffer next
    nnoremap <Leader>bn :bn<CR>

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "IndentLine
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    nnoremap <Leader>il :IndentLinesToggle<CR>
    highlight Conceal ctermfg=239 ctermbg=NONE guifg=Grey35 guibg=NONE
endif

""""""""""""""""""""""""""""""""
"   VIMRC of Yehuda Tsimanis   "
""""""""""""""""""""""""""""""""
" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

set backspace=indent,eol,start " allow backspacing over everything in insert mode

set number                     " set line numbers and its colour

set ignorecase
set smartcase
set incsearch                  " match as characters are entered
set hlsearch                   " to highlight name on search:
set showmatch                  " Show matching brackets when text indicator is over them
set mat=2                      " How many tenths of a second to blink when matching brackets

""""""""""""""""""""""
" Syntax and colours "
""""""""""""""""""""""
syntax enable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Another preferred custom colorscheme """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme desert
"set gcr=n-v-c:block-Cursor/lCursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175 " select font size
"highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Another preferred custom colorscheme """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if &diff
   """"""""""""""""""""""""""""""""""""""""""""""""""""
   """""""""""""setup for GVIMDIFF     mode""""""""""""
   """"""""""""""""""""""""""""""""""""""""""""""""""""
   " Next/Prev diff : ]c/[c
   " Diff obtain/put: do/dp
   " diffupdate     : refresh
   """"""""""""""""""""""""""""""""""""""""""""""""""""
    set background=light
    if has('gui_running')
       colorscheme PaperColor
    else
       colorscheme slate
    endif

    syntax off

    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 13

    " Window size and shapeo
    set lines=90
    set columns=300

   "highlight DiffAdd    gui=none guifg=NONE    guibg=#bada9f
   "highlight DiffChange gui=none guifg=NONE    guibg=#e5d5ac
   "highlight DiffDelete gui=bold guifg=#ff8080 guibg=#ffb0b0
   "highlight DiffText   gui=none guifg=NONE    guibg=#8cbee2
else
   """""""""""""setup for REGULAR GVIM mode"""""""""""""
   " Window size and shape
   set lines=90
   set columns=220

   " foldmethod option marker
   set foldmethod=syntax
   set nofoldenable
   " Mark   your code snippet as visual block
   " and press:
   "     * zf to mark it as folding
   "     * zd to remove folding
   "     * zo/zc for opening/closing folds
   set background=dark
   if has('gui_running')
       colorscheme PaperColor
   else
       colorscheme slate
   endif

   set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 13

   "Hidden characters :set list/nolist for showing/hiding the hidden characters
   highlight NonText ctermfg=239 guifg=gray25
   set listchars=tab:▸\ ,nbsp:␣,trail:·,eol:¶,precedes:«,extends:»
   "Show/hide hidden characters
   nnoremap <Leader>hc :set list!<CR>
endif

"Best setup for white-space usage. More: http://vimcasts.org/episodes/tabs-and-spaces
" 1. Set  have (softtabstop == shiftwidth) to have a consistent behaviour between:
"     @ inserting (TAB/white-space) or removing (BACKSPACE) characters in INSERT mode
"     @ shifting back & forth by </> in NORMAL mode
" 2. Changing tabstop will change width of all TAB characters in files automatically
set softtabstop=4   " fine-tunes the amount of white-space to be inserted
set tabstop    =4   " specifies the width of a tab character (how many white-spaces are in a tab)
set shiftwidth =4   " determines the amount of white-spaces to insert/remove by using indentation commands in normal mode
set expandtab       " causes white-spaces of equivalent width to inserted instead of tab characters. Switch expandtab to noexpandtab to use tabs

set history=500     " keep 500 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set vb
set sta
set et
set ai
set si
set nocin
set nowrap
set textwidth=0     " don't break lines w/ a new line after passing beyond certain line width

"Applies the JavaScript syntax on GAS (Google Apps Script)
autocmd BufNewFile,BufRead *.gs set filetype=javascript

set wb
set nosol
set nobackup
set noswapfile

" disables error sounds & error screen flashin
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"Auto saves files on exit of insert mode
autocmd InsertLeave * update

""""""""""""""""""""""General mappings""""""""""""""""""""""
"Ignore white spaces and upper/lower case in the diff tool. It's not 
"under 'if &diff', as it doesn't work w/ Gdiff, if loaded later. 
nnoremap <Leader>iw :set diffopt+=iwhite<CR>
nnoremap <Leader>ic :set diffopt+=icase<CR>

" Change dir to the one of the current file
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

"Copy current file fullpath to * & " registers
noremap <Leader>fp :let @* = expand("%:p")<CR>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>/\r/ge<cr>'tzt'm

"Retab a file (turn TABs to white-spaces)
nnoremap <Leader>t :retab

" Re-indend all the file by using the automatic indentation setting:
" http://vim.wikia.com/wiki/Fix_indentation
" http://vim.wikia.com/wiki/Indenting_source_code
map <Leader>rif mzgg=G`z
""""""""""""""""""""""""""""""""""""""""""""""""""""
