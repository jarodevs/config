source ~/.zshenv
source $ZDOTDIR/scripts/git-prompt.sh

function mod_git_prompt()
{
	if git rev-parse --is-inside-work-tree > /dev/null 2>&1
	then 
		git_prompt="echo '$(__git_ps1)' | sed -e 's/(/|/; s/)/|/; s/ //'"

		echo "\n%F{117}⚇ ⟶%f %F{40}$(eval $git_prompt)%f"		
	else
		echo "\n%F{117}○ ⟶%f "
	fi
}
