ZSH_THEME="typewritten/typewritten"
source ~/bin

export ZSH="$HOME/.config/.oh-my-zsh"
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
alias kubectl="minikube kubectl --"
alias yabai-echo-new-version="echo \"$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa\" | sudo tee /private/etc/sudoers.d/yabai"
alias yabai-update-in-file="sudo visudo -f /private/etc/sudoers.d/yabai"
alias start-ai-agent="cd ~/Gorgias/ai-agent && git pull origin main --rebase && npm install && launchctl start jarodevs.gorgias.ai-agent"
alias start-helpdesk="cd ~/Gorgias/helpdesk && git pull origin main --rebase && docker compose up --build -d && docker compose exec web flask tickets sync_tickets_in_elasticsearch && docker compose exec web flask customers sync_customers_in_es"
alias start-help-center="cd ~/Gorgias/help-center && git pull origin main --rebase && docker compose up --build -d"
alias start-helpdesk-web-app="cd ~/Gorgias/helpdesk-web-app && git pull origin main && nvm use && yarn install && launchctl start jarodevs.gorgias.helpdesk-web-app"
alias start-sendgrid-inbound="cd ~/Gorgias/sendgrid-inbound && git pull origin main && docker compose up --build -d"
alias start-gorgias-stack="start-ai-agent && start-helpdesk && start-help-center && start-helpdesk-web-app && start-sendgrid-inbound &&launchctl start jarodevs.gorgias.ngrok"

# ENV
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#9be0f7,bg=#162c70,bold,underline"
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
#COMPLETION_WAITING_DOTS="true"
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    #zsh-autocomplete
)

TYPEWRITTEN_PROMPT_LAYOUT="pure"

source $ZSH/oh-my-zsh.sh
