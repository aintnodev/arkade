ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"

# load ohmyzsh plugins
zinit snippet OMZP::colorize
zinit snippet OMZP::thefuck
zinit snippet OMZP::vi-mode

# load remote plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light marlonrichert/zsh-autocomplete

# source external files
source $HOME/.zaliases
source $HOME/.zshenv

# cd to folder when quitting lf (terminal file manager)
lfcd() {
	cd "$(command lf -print-last-dir "$@")"
}

# ohmyposh
eval "$(oh-my-posh init zsh --config $XDG_CONFIG_HOME/ohmyposh/theme.toml)"

# load nvm annd nvm bash_completion
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

