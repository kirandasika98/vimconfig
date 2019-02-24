set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=UTF-8

" this enables project specific vimrc settings
set exrc

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" === Plugin Manager
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdcommenter'
Plugin 'itchyny/lightline.vim'

" Golang plugins
Plugin 'fatih/vim-go'
Plugin 'fatih/molokai'
Plugin 'SirVer/ultisnips'

"Python plugins
Plugin 'Vimjas/vim-python-pep8-indent'

" Typescript plugins
Plugin 'leafgarland/typescript-vim'

" JSX/React plugins
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Themes
Plugin 'morhetz/gruvbox'
Plugin 'liuchengxu/space-vim-dark'
Plugin 'erichdongubler/vim-sublime-monokai'
Plugin 'junegunn/seoul256.vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'dracula/vim'

" Helpers
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'skywind3000/asyncrun.vim'
 Plugin 'editorconfig/editorconfig-vim'
Plugin 'nathanaelkane/vim-indent-guides'

call vundle#end()            " required
filetype plugin indent on    " required

set background=dark
colorscheme space-vim-dark
let g:seoul256_background = 236

" Syntax Highlighting
syntax on
" Autoreloading for .vimrc files
autocmd! bufwritepost .vimrc source %
" Better copy & pate
set pastetoggle=<F2>
set clipboard=unnamed
" Mouse and backspacet
set mouse=a
set bs=2
" set tabs to have 4 spaces
set ts=4
" indent when moving to the next line while writing code
set autoindent
" expand tabs into spaces
set expandtab
" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4
" show a visual line under the cursor's current line
set cursorline
" show the matching part of the pair for [] {} and ()
"set showmatch
set noshowmatch
set colorcolumn=80

" enable all Python syntax highlighting features
let python_highlight_all = 1

" Will be easier to switch modes
inoremap jj <ESC>

" Turn backup off, since most stuff is in SVN, git etc anyway...
set nobackup
set nowb
set noswapfile

" some todo stuff
au BufRead,BufNewFile *.todo setfiletype todo
au BufRead,BufNewFile TODO setfiletype todo

" vim-go settings
let g:go_fmt_command = "goimports"
let g:go_auto_sameids = 1

" easy switch panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" === set indentation for yaml files to 2
"autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
"autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab

" === flake8
let g:flake8_show_in_file=1

" turn hybrid line numbers on
set number relativenumber
set nu rnu

" Lightline settings
set laststatus=2
if !has('gui_running')
    set t_Co=256
endif

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ }

" fzf settings
set rtp+=/usr/local/opt/fzf
nnoremap <C-p> :Files<Cr>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
"let g:fzf_layout = { 'window': 'enew' }
"let g:fzf_layout = { 'window': '-tabnew' }
"let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Nerd tree settings
map <C-m> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

