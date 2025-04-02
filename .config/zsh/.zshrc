export ZSH="$HOME/.config/.oh-my-zsh"


source /opt/z/z.sh


# PATH
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/opt/emacs-plus@29/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Library/Apple/usr/bin:/usr/local/MacGPG2/bin:/Users/jarodevs/.cargo/bin:/Users/jarodevs/bin:/usr/local/MacGPG2/bin:/opt/homebrew/opt/openjdk@11/bin:/opt/homebrew/opt/llvm/bin
# END PATH


alias build_emacs="cd $XDG_CONFIG_HOME/emacs && make clean && make"
alias gpg="/usr/local/MacGPG2/bin/gpg"
alias docker-compose="docker compose"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias gcproxy-keru-production="cloud-sql-proxy -i keruproject-production:europe-west9:main --port 5432"
alias gcproxy-gorgias-ai_agent-staging="cloud-sql-proxy -i gorgias-conversations-staging:us-central1:ai-agent-7d442106 --port 4933"
alias gcproxy-gorgias-ai_agent-production="cloud-sql-proxy -i gorgias-conversations-prod:us-central1:ai-agent-ca38aecc --port 4932"
alias gcproxy-gorgias-chat-staging="cloud-sql-proxy -i gorgias-chat-staging:us-east1:chat-03b7c90c --port 4935"
alias gcproxy-gorgias-chat-production="cloud-sql-proxy -i gorgias-chat-production:us-east1:chat-f1b2e115 --port 4936"
alias gcproxy-gorgias-help_center-production="cloud-sql-proxy -i gorgias-help-center-production:us-central1:help-center-d227c56a --port 4934"
alias dpss="docker ps --format '{{.ID}} {{.Names}} {{.Status}}' | awk 'BEGIN { printf \"%-20s %-50s %-50s\\n\", \"CONTAINER ID\", \"NAME\", \"STATUS\" } { printf \"%-20s %-50s %-50s\\n\", \$1, \$2, \$3 }'"
alias dcpss="docker compose ps --format '{{.ID}} {{.Names}} {{.Status}}' | awk 'BEGIN { printf \"%-20s %-50s %-50s\\n\", \"CONTAINER ID\", \"NAME\", \"STATUS\" } { printf \"%-20s %-50s %-50s\\n\", \$1, \$2, \$3 }'"
alias sed="gsed"

# ENV
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#9be0f7,bg=#162c70,bold,underline"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(
    git
    zsh-autosuggestions
)

TYPEWRITTEN_PROMPT_LAYOUT="pure"

source $ZSH/oh-my-zsh.sh


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jarodevs/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jarodevs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jarodevs/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jarodevs/google-cloud-sdk/completion.zsh.inc'; fi

# eval "$(starship init zsh)"
# starship preset nerd-font-symbols -o ~/.config/starship.toml

# NVM
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
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
# END NVM

