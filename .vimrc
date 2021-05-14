if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Color Scheme
" Plug 'romainl/flattened'
" Plug 'AffanIndo/vim-todo-color'
" Plug 'w0ng/vim-hybrid'
" " General
" Plug 'tmsvg/pear-tree'
" Plug 'lifepillar/vim-mucomplete'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-commentary'
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'Yggdroot/indentLine', { 'for': 'html' }
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" " Language-specific
" Plug 'junegunn/goyo.vim'
" Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'php'] }
" Plug 'ap/vim-css-color', { 'for': ['html', 'css', 'php'] }
Plug 'luochen1990/rainbow'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'https://github.com/tpope/vim-eunuch'
Plug 'preservim/nerdtree'
call plug#end()

let g:rainbow_active = 1

:set nu

map <F1> :NERDTreeToggle<CR>

