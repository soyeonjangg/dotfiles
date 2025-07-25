if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/soyeonjang/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/soyeonjang/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/soyeonjang/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/soyeonjang/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
export TERM=xterm-256color

