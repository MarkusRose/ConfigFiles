" IMPORTANT COMMANDS FOR ME TO REMEMBER:
" Findoccurance:
" * #
" Jumping: next "method" structure
" ]m ]M [m [M
" Splits:
" maximize: ^W_   ^W|
" fill width/height: ^WK ^WH
" select first split: ^Wt
" Tabbing:
" :tabe to create and gt gT to switch
" Folding:
" za
"

"enter the current millenium
set nocompatible

" show typed commands (bottom right)
set showcmd

" allow search for ignorecase unless upper case letter in search term:
set smartcase

" get rid of arrow key problems
nnoremap <Left> :echo "No left for you!"<CR>
nnoremap <Right> :echo "No right for you!"<CR>
nnoremap <Up> :echo "No up for you!"<CR>
nnoremap <Down> :echo "No down for you!"<CR>
vnoremap <Left> <nop>
vnoremap <Right> <nop>
vnoremap <Up> <nop>
vnoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>

"enable syntax and plugins
syntax enable
filetype indent on
filetype plugin on
let python_highlight_all=1

" FINDING FILES:
" Search down into subfolders with tab completion
set path+=**
" Display all matching files when we tab complete
set wildmenu

" Background color
colorscheme desert
set background=dark

" Set text width marker
set textwidth=0
highlight ColorColumn ctermbg=65 guibg=#2c2d27
set colorcolumn=80 

" Indentation 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set encoding=utf-8
"allow for code folding with 'za' key compbination
set foldmethod=indent
set foldlevel=99

" Line numbering and wrapping
set nu
set relativenumber
set whichwrap+=>,l
set whichwrap+=<,h

" Make the statusline pretty
set laststatus=2
"set statusline=%<
"set statusline+=%f
""set statusline+=%t       "tail of the filename
"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
"set statusline+=%{&ff}] "file format
"set statusline+=%h      "help file flag
"set statusline+=%m      "modified flag
"set statusline+=%r      "read only flag
"set statusline+=%y      "filetype
"set statusline+=%=      "left/right separator
"set statusline+=%c,     "cursor column
"set statusline+=%l/%L   "cursor line/total lines
"set statusline+=\ %P    "percent through file

" GVIM options
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
highlight Normal guifg=white guibg=black

" VIM AUTOCOMPLETION:
" good documentation in |ins-completion|

" TAG JUMPING:
" Create the 'tags' file
" ^] jump to tag (definition)
" g^] ambiguous tags jump
" ^t jump back through the tag-stack
command! MakeTags !ctags -R .

" FILE BROWSING:
let g:netrw_banner=0        "disable banner
let g:netrw_browse_split=4  "open in prior window
let g:netrw_altv=1          "open splits to the right
let g:netrw_liststyle=3     "tree view
let g:netrw_list_hide=netrw_gitignore#Hide()

" SPELL CHECKER:
" use ]s and [s to jump to next/previous misspelled word
" use z= to see corrections
" use zg to add word to dictionary
" use zw to mark word as wrong
set spelllang=en_ca
"set spell
set nospell

" FILE SPECIFIC SETTINGS:
" For python files:
au BufNewFile,BufRead *.py
    \set fileformat=unix
" For JavaScript, HTML, CSS
au BufNewFile,BufRead *.js,*.html,*css setlocal tabstop=2 softtabstop=2 shiftwidth=2 
" For LaTeX files:
au BufNewFile,BufRead *.tex setlocal spell tabstop=2 softtabstop=2 shiftwidth=2


" BEWARE PLUGINS LIVE HERE:
" =========================

" VUNDLE INITIALIZATION:
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'preservim/nerdtree'
"Plugin 'powerline/powerline'
Plugin 'itchyny/lightline.vim'
"Plugin 'vim-airline/vim-airline'
set noshowmode

call vundle#end()
filetype indent on
filetype plugin on

" JEDI OPTIONS:
let g:jedi#popup_on_dot=0  "Don't automatically start jedi on entering a '.'
let g:jedi#use_tabs_not_buffers = 1 "make jedi-vim use tabs when going to a definition
autocmd FileType python setlocal completeopt-=preview
