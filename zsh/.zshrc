# oh-my-zsh
ZSH_THEME=""
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(colorize command-not-found thefuck vi-mode zsh-autocomplete zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# source external files
source $HOME/.zaliases
source $HOME/.zshenv

# cd to folder when quitting lf (terminal file manager)
lfcd() {
  cd "$(command lf -print-last-dir "$@")"
}

eval "$(oh-my-posh init zsh --config $XDG_CONFIG_HOME/oh-my-posh/posh-theme.json)"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
