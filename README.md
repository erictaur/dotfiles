# dotfiles

This is the repo (backup) of my .files for the following:
* vim (personal/.vimrc)
* tmux (personal/.tmux.conf)
* SSH config files (personal/config)
* bash (vlsipool/.bashrc)
* Other workspace files (in gcp/ and vlsipool/)

## Useful Links/Resources

### Vim
These four lines at the top of the file install the plugin manager `Plug`

Add the "-k" option if an security override is needed
```
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
```
Currently installed plugins:
* nerdtree (File Navigation)
* vim-eunuch (Vim sugar for UNIX shell commands)
* verilog_systemverilog.vim (Syntax Highlighting)
* rainbow (Parentheses level differentiation)
* fzf and fzf.vim (Fuzzy search files)

