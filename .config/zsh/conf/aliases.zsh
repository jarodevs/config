# Yay alias is better than paru
alias yay='paru'
# replacing `ls` with `exa`
alias l='exa --color=always --sort=type -1 --icons'
alias la='exa -a --color=always --sort=type -1 --icons'
alias rls="clear ; ls"
alias rla="clear ; la"

# confirm before performing action
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# git
alias gs='git status'
alias gp='git push -u origin HEAD'
alias gp+='git push --force'
alias ga='git add'
alias gb='git checkout'
alias gf='git fetch --all --prune'
alias gl='git log --color --graph --pretty=format:"%C(bold white)%h%Creset -%C(bold green)%d%Creset %s %C(bold red)(%cr)%Creset %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative --oneline'
alias gc='git commit'

# neovim typing errors
alias v='nvim'

# stop writing 'python' in full
alias py="python"

# some cd aliases that make life 10 times easier
alias g="goto" # when yes
alias c="cd" # fast
alias d="cd" # fast
alias dc="cd" # i don't need this
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# extraction
ex ()
{
    if [ -f $1 ] ; then
        case $1 in
        *.tar.bz2)   tar xjf $1   ;;
        *.tar.gz)    tar xzf $1   ;;
        *.bz2)       bunzip2 $1   ;;
        *.rar)       unrar x $1   ;;
        *.gz)        gunzip $1    ;;
        *.tar)       tar xf $1    ;;
        *.tbz2)      tar xjf $1   ;;
        *.tgz)       tar xzf $1   ;;
        *.zip)       unzip $1     ;;
        *.Z)         uncompress $1;;
        *.7z)        7z x $1      ;;
        *.deb)       ar x $1      ;;
        *.tar.xz)    tar xf $1    ;;
        *.tar.zst)   unzstd $1    ;;
        *)           echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# SQL connection - Eimy - sql proxy google cloud
alias sqlproxy-keru-dev="cloud_sql_proxy -instances=black-overview-387614:europe-west9:kerudb=tcp:5555 > /dev/null & disown %cloud_sql_proxy"
alias sqlproxy-technikwerk-dev="cloud_sql_proxy -instances=technikwerk-dev:europe-west3:technikwerk-dev=tcp:5433 > /dev/null & disown %cloud_sql_proxy"

# Protonvpn
alias vpn_co_random_udp_fastest='sudo protonvpn c -f -p "UDP"'
alias vpn_disco='sudo protonvpn d'

# info
alias info='info --vi-keys'

# SWAY
# toggle laptop video output
alias tlvo='swaymsg output eDP-1 toggle'

# Needed to make kitty work with ssh
alias ssh='env TERM=xterm-256color ssh'

alias psql='/opt/homebrew/opt/postgresql@15/bin/psql'
