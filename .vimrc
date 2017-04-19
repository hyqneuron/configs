"============================
"============================
"Vundle, weds git with pathogen
"============================
"============================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" gitusername/reponame
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
"Plugin 'vim-scripts/taglist.vim'
Plugin 'majutsushi/tagbar'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'kana/vim-arpeggio'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ









"============
"Meta mapping
"============
" fix meta-keys which generate <Esc>a .. <Esc>z
"let c='a'
"while c <= 'z'
"exec "set <M-".toupper(c).">=\e".c
	"exec "imap \e".c." <M-".toupper(c).">"
	"let c = nr2char(1+char2nr(c))
"endw

"=========================
"=========================
"OPTIONAL SETTINGS
"=========================
"=========================


"============
"QuickMove
"============
"i: hjkl to move cursor
"n: jk to scroll down/up, th,tl to go to left/right tab
imap <F2> <C-o>:call ToggleQuickMove()<CR>
map <F2> :call ToggleQuickMove()<CR>

function! ToggleQuickMove()
	if !exists("s:imove")
		let s:imove=0 "zero: not enabled
	endif
	if s:imove
		map j gj
		map k gk
        unmap d
        unmap u
		let s:imove = 0
		echo "QuickMove Off"
	else
		map j 2<C-e>2<Down>
		map k 2<C-y>2<Up>
        map d <C-d>
        map u <C-u>
		let s:imove = 1
		echo "QuickMove On"
	endif
endfunction

"============
"Display Line Movement
"============
function! SetGMove()
	nnoremap j gj
	nnoremap k gk
	nnoremap <Up> gk
	nnoremap <Down> gj
endfunction
function! UnSetGMove()
	unmap j 
	unmap k 
	unmap <Up> 
	unmap <Down> 
endfunction
"============
"Display Line Movement
"============
function! SetTabJumps()
    nnoremap gt0 :tabfirst<CR>
    nnoremap gt1 :2tabnext<CR>
    nnoremap gt2 :3tabnext<CR>
    nnoremap gt3 :4tabnext<CR>
    nnoremap gt4 :5tabnext<CR>
    nnoremap gt5 :6tabnext<CR>
    nnoremap gt6 :7tabnext<CR>
    nnoremap gt7 :8tabnext<CR>
    nnoremap gt8 :9tabnext<CR>
    nnoremap gt9 :10tabnext<CR>
endfunction
function! UnSetTabJumps()
    unmap gt0 
    unmap gt1
    unmap gt2
    unmap gt3
    unmap gt4
    unmap gt5
    unmap gt6
    unmap gt7
    unmap gt8
    unmap gt9
endfunction



"=========================
"=========================
"Plugins and sessions
"=========================
"=========================
"NERDTree
map <F5> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\~$', '\.pkl$', '\.pyc$']
filetype plugin on
"TagBar
map <F3> :TagbarToggle<CR>
let g:tagbar_left=1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
"BufExplorer
map <F4> :ToggleBufExplorer<CR>
let g:bufExplorerSortBy='fullpath'
let g:bufExplorerShowRelativePath=1
"Arpeggio chording
"Arpeggio inoremap jk <Esc>
"VIMRC
command! ReloadVIMRC source $MYVIMRC
command! EditVIMRC tabe ~/.vimrc
"Session
command! Ss mksession! ~/.vimsession
command! Sl source ~/.vimsession

command! Ss1 mksession! ~/.vimsession1
command! Sl1 source ~/.vimsession1

command! Ss2 mksession! ~/.vimsession2
command! Sl2 source ~/.vimsession2

command! Ss3 mksession! ~/.vimsession3
command! Sl3 source ~/.vimsession3

command! Ss4 mksession! ~/.vimsession4
command! Sl4 source ~/.vimsession4

command! Ss5 mksession! ~/.vimsession5
command! Sl5 source ~/.vimsession5

command! Ss6 mksession! ~/.vimsession6
command! Sl6 source ~/.vimsession6

"==============================
"==============================
"Quirky little things
"==============================
"==============================
" swap escape with tab
" quick-fix window
noremap <C-Down> :cn<CR>
noremap <C-Up> :cp<CR>
" quick 3-word jumps
" nnoremap q 3w
" nnoremap Q 3b
" noremap [q q
" start editing at end of file
nnoremap gz Gzzo
"cancel highlight
nnoremap <F6> :nohl<CR>
" show tag stack
nnoremap <F7> :tags<CR>
" switch buffer
nnoremap <F8> :b#<CR>
" tab-left and tab-right
nnoremap H <C-PageUp> <C-L>
nnoremap L <C-PageDown> <C-L>
nnoremap gh H
nnoremap gm M
nnoremap gl L
" more easily jump to beginning of line
nnoremap ` ^
nnoremap 0 $
nnoremap $ `
" wrap-line movement
call SetGMove()
nnoremap gT :tablast<CR>



" sdfasdf horrible adsf  ak"k
" pylearn2-yaml is has a horrible highlighting engine
au BufRead,BufNewFile *.yaml set ft=none

syntax on
set et
set sw=4
set sts=4
set ts=4
set tw=120
set nu linebreak wrap!
set cindent
set hlsearch
set clipboard="0"  "make pasting easier"
set go-=T
set go-=m
set go-=e
set noautochdir
set guifont=Monospace\ 9
colorscheme desert
hi TabLine gui=none guibg=Gray20
hi TabLineSel guifg=yellow guibg=gray40
