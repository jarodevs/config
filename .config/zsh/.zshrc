#ZSH_THEME="typewritten/typewritten"
export XDG_CONFIG_HOME="/Users/jarodevs/.config"
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

alias ssh="kitty +kitten ssh"
alias docker-compose="docker compose"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias kubectl="minikube kubectl --"
alias gcproxy-keru-production="cloud-sql-proxy -i keruproject-production:europe-west9:main --port 5432"
alias gcproxy-gorgias-ai_agent-staging="cloud-sql-proxy -i gorgias-conversations-staging:us-central1:ai-agent-7d442106 --port 4933"
alias gcproxy-gorgias-ai_agent-production="cloud-sql-proxy -i gorgias-conversations-prod:us-central1:ai-agent-ca38aecc --port 4932"
alias gcproxy-gorgias-chat-staging="cloud-sql-proxy -i gorgias-chat-staging:us-east1:chat-03b7c90c --port 4935"
alias gcproxy-gorgias-chat-production="cloud-sql-proxy -i gorgias-chat-production:us-east1:chat-f1b2e115 --port 4936"
alias gcproxy-gorgias-help_center-production="cloud-sql-proxy -i gorgias-help-center-production:us-central1:help-center-d227c56a --port 4934"

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

export PATH=/Users/jarodevs/.config/nvm/versions/node/v20.12.2/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Library/Apple/usr/bin:/usr/local/MacGPG2/bin:/Users/jarodevs/.cargo/bin:/Users/jarodevs/bin

GPG_TTY=$(tty)
export GPG_TTY
export EDITOR="emacsclient"
export SOPS_GCP_KMS_IDS=projects/keruproject-dev/locations/global/keyRings/sops/cryptoKeys/df3e1271-7f0e-4211-abf3-416c596956b6

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jarodevs/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jarodevs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jarodevs/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jarodevs/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(starship init zsh)"
starship preset nerd-font-symbols -o ~/.config/starship.toml
