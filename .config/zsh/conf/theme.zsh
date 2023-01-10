# allows colors in zsh prompt
autoload -U colors && colors
setopt prompt_subst

# Render newline after command
precmd() {
    precmd() {
        echo
    }
}

# autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#575757"

#Prompt
source $ZDOTDIR/scripts/mod-git-prompt.sh

setopt PROMPT_SUBST ; PS1='%B%F{208}%n%f%b in %B%F{117}%2~%f$(mod_git_prompt) '
