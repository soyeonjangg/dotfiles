# dotfiles
inspired by @jamesnicolas
- mac environment

Suggest using iterm2 instead of the default terminal
```
vim ~/.tmux.conf
vim ~/.vimrc
```

In order to reload tmux config changes,
```
ctrl + b, :
:source-file ~/.tmux.conf
```

In order to install vim plugins for the first time, need to install vundle. refer to: https://github.com/VundleVim/Vundle.vim

Once installed, run 
```
:source %
:PluginInstall
``` 
in ~/.vimrc
