source /opt/homebrew/share/antigen/antigen.zsh
source /opt/homebrew/opt/spaceship/spaceship.zsh
source ~/bin
source ~/.profile

antigen bundle zsh-users/zsh-autosuggestions

antigen apply

SPACESHIP_GCLOUD_SHOW=false
SPACESHIP_NODE_SHOW=false
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#9be0f7,bg=#162c70,bold,underline"


function brew() {
  command brew "$@" 

  if [[ $* =~ "upgrade" ]] || [[ $* =~ "update" ]] || [[ $* =~ "outdated" ]]; then
    sketchybar --trigger brew_update
  fi
}

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
# Automatically execute nvm use in .nvmrc directory
autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

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
alias yabai-echo-new-version="echo \"$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa\" | sudo tee /private/etc/sudoers.d/yabai"
alias yabai-update-in-file="sudo visudo -f /private/etc/sudoers.d/yabai"
alias start-ai-agent="cd ~/Gorgias/ai-agent && git pull origin main --rebase && npm install && launchctl start jarodevs.gorgias.ai-agent && launchctl start jarodevs.gorgias.ai-agent.ngrok"
alias start-helpdesk="cd ~/Gorgias/helpdesk && git pull origin main --rebase && docker compose up --build -d && docker compose exec web flask tickets sync_tickets_in_elasticsearch && docker compose exec web flask customers sync_customers_in_es"
alias start-help-center="cd ~/Gorgias/help-center && git pull origin main --rebase && docker compose up --build -d"
alias start-helpdesk-web-app="cd ~/Gorgias/helpdesk-web-app && git pull origin main && nvm use && yarn install && launchctl start jarodevs.gorgias.helpdesk-web-app"
alias start-gorgias-stack="start-ai-agent && start-helpdesk && start-help-center && start-helpdesk-web-app"
