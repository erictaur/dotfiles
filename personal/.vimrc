""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INSTALL VIM-PLUG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -k -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INSTALL SELECTED PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
" Color Scheme
Plug 'pgavlin/pulumi.vim'
" Plug 'https://github.com/joshdick/onedark.vim.git'
" Plug 'AffanIndo/vim-todo-color'
" Plug 'w0ng/vim-hybrid'
" " General
Plug 'luochen1990/rainbow'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'lfv89/vim-interestingwords'
Plug 'zirrostig/vim-schlepp'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTING VARIABLES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set relative ordering and screen color options
set term=screen-256color
set t_Co=256
set nu
set rnu
syntax on

set showmatch
set tabstop=4
set shiftwidth=4
set expandtab

" Set recursive search by default and enable auto-complete menu
set path+=**
set wildmenu

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" AIRLINE SETTINGS
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tmuxline#enabled = 1
let g:airline_theme='onedark'
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"

" COLOR SCHEME PLUGIN SET
set background=dark
colorscheme pulumi

" TMUX-LINE PLUGIN SETTINGS
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H'}
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}

" NERDTREE PLUGIN SETTINGS
let g:NERDTreeShowLineNumbers=1
autocmd BufEnter NERD_* setlocal rnu " Show rnu in NERDtree window

" vim-Schlepp PLUGIN SETTINGS
vmap <up>    <Plug>SchleppUp
vmap <down>  <Plug>SchleppDown
vmap <left>  <Plug>SchleppLeft
vmap <right> <Plug>SchleppRight

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEYBOARD MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Copy line without linebreak
nnoremap Y 0vg_y

" List all buffers
nnoremap <leader>b :buffers<CR>:buffer<Space>

" Search word under cursor and open location list
nnoremap <leader>f :lvim <cword> % <CR>:lopen<CR>

" Fuzzy search files to open as new buffer with fzf
nnoremap <C-p> :Files<Cr>

" Open NERDTree window
map <leader>N :NERDTreeToggle<CR>
