export PATH=/opt/homebrew/bin:$PATH

SSH_PRIV_KEY_PATH=~/.ssh/id_rsa
SSH_USERNAME=sjang

alias config='/usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME'

# brew install starship
eval "$(starship init bash)"

