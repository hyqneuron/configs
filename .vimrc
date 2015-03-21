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
		"iunmap j
		"iunmap k
		"iunmap h
		"iunmap l
		unmap th
		unmap tl
		let s:imove = 0
		echo "QuickMove Off"
	else
		map j 2<C-e>2<Down>
		map k 2<C-y>2<Up>
		"imap j <C-o>j
		"imap k <C-o>k
		"imap h <C-o>h
		"imap l <C-o>l
		map th :tabp<CR>
		map tl :tabn<CR>
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



"=========================
"=========================
"BASIC SETTINGS
"=========================
"=========================
"NERDTree
map <F5> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\~$', '\.pkl$']
filetype plugin on
"TagList
"map <F4> :TlistToggle<CR>
"command! T1 let Tlist_Show_One_File=1
"command! Ta let Tlist_Show_One_File=0
"TagBar
map <F3> :TagbarToggle<CR>
let g:tagbar_left=1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
"BufExplorer
map <F4> :ToggleBufExplorer<CR>
let g:bufExplorerSortBy='fullpath'
let g:bufExplorerShowRelativePath=1
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

"==============================
"Quirky little things
"==============================
"quick-fix window
map <C-Down> :cn<CR>
map <C-Up> :cp<CR>
"wrap-line movement
call SetGMove()
"quick 3-word jumps
noremap q 3w
noremap Q 3b
noremap [q q
"pylearn2-yaml is has a horrible highlighting engine
au BufRead,BufNewFile *.yaml set ft=none
"cancel highlight
nnoremap <F6> :nohl<CR>

syntax on
set et sw=4 sts=4
set tw=80
set nu linebreak wrap!
set smartindent
set hlsearch
set clipboard=unnamed
set go-=T
set go-=m
set go-=e
set noautochdir
set guifont=Monospace\ 9
colorscheme desert
hi TabLine gui=none guibg=Gray20
hi TabLineSel guifg=yellow guibg=gray40
