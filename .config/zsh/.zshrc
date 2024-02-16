source /opt/homebrew/share/antigen/antigen.zsh
source /opt/homebrew/opt/spaceship/spaceship.zsh
source ~/.profile

antigen bundle zsh-users/zsh-autosuggestions

antigen apply

SPACESHIP_GCLOUD_SHOW=false
SPACESHIP_NODE_SHOW=false
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#112A46,bg=#ACC8E5,bold,underline"


function brew() {
  command brew "$@" 

  if [[ $* =~ "upgrade" ]] || [[ $* =~ "update" ]] || [[ $* =~ "outdated" ]]; then
    sketchybar --trigger brew_update
  fi
}

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Configuration for emacs vterm module
vterm_printf() {
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ]); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

export PATH="$HOME/bin:$PATH"
alias kubectl="minikube kubectl --"
