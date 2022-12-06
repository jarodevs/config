## LIB: Base Configuration (Copied from OMZ)

source $ZDOTDIR/lib/history.zsh
source $ZDOTDIR/lib/completions.zsh
source $ZDOTDIR/lib/keybindings.zsh
source $ZDOTDIR/lib/vim.zsh

## CONFIGURATION: My Configuration

source $ZDOTDIR/conf/aliases.zsh
source $ZDOTDIR/conf/exports.zsh
source $ZDOTDIR/conf/theme.zsh
source $ZDOTDIR/conf/plugins.zsh
source $ZDOTDIR/conf/general.zsh

autoload -Uz compinit && compinit
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
