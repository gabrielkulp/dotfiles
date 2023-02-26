#sleep 0.5 # added to mitigate extra % symbol on Black Box
#echo -n "gk@framework, "
#date +%H:%M

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
#USE_POWERLINE="true"
# Use manjaro zsh prompt
if [[ -r /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
if [[ -r /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

if [ -r ~/.aliases ]; then
	# More robust use_color check
	case ${TERM} in
		xterm*|ansi|*color*)
			use_color=true;;
		*)
			use_color=false;;
	esac
	export use_color
	source ~/.aliases
	unset use_color
fi
export HISTCONTROL=ignoreboth:erasedups
#export HISTFILE=~/.zhistory
# bind UP and DOWN arrow keys to history substring search
#zmodload zsh/terminfo
#bindkey "$terminfo[kcuu1]" history-substring-search-up
#bindkey "$terminfo[kcud1]" history-substring-search-down
#bindkey '^[[A' history-substring-search-up
#bindkey '^[[B' history-substring-search-down

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
