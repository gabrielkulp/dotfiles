#
# ~/.bashrc
#

# Do not continue if running in interactive mode
[[ $- != *i* ]] && return

if [ -r /usr/share/bash-completion/bash_completion ]; then
	# disable "that file doesn't exist" warning since I already checked
	# shellcheck disable=SC1091
	. /usr/share/bash-completion/bash_completion
fi

# Override below use_color check if using kitty
case ${TERM} in
	*256color|*kitty)
		use_color=true
		;;
	*)
		use_color=false
		;;
esac

# Set use_color based on TERMs listed in dircolors --print-database.
# Weird syntax is internal Bash globbing instead of external grep.
# Also checks for local .dir_colors overrides
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -r ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -r /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] && type -P dircolors >/dev/null \
&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true
unset safe_term match_lhs

if ${use_color}; then

	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null; then
		if [[ -r ~/.dir_colors ]]; then
			eval "$(dircolors -b ~/.dir_colors)"
		elif [[ -r /etc/DIR_COLORS ]]; then
			eval "$(dircolors -b /etc/DIR_COLORS)"
		fi
	fi

	if [[ ${EUID} == 0 ]]; then
	#	PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]#\[\033[00m\] '
		PS1='\[\033[01;36m\]\W\[\033[01;31m\] #\[\033[00m\] '
	else
	#	PS1='\[\033[01;32m\][\u@\h\[\033[01;36m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
		PS1='\[\033[01;36m\]\W\[\033[01;32m\] \$\[\033[00m\] '
	fi

else
	if [[ ${EUID} == 0 ]]; then
		PS1='\W \# '
	else
		PS1='\W \$ '
	fi
fi

if [ -r "$HOME/.aliases" ]; then
	export use_color
	source "$HOME/.aliases"
fi

unset use_color

xhost +local:root > /dev/null 2>&1

# Check if window was resized while something else was in the foreground.
# Otherwise the foreground process intercepts SIGWINCH and bash is confused
shopt -s checkwinsize

shopt -s expand_aliases

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

export HISTCONTROL=ignoreboth:erasedups
if type -P vim &>/dev/null; then
	EDITOR=$(type -P vim)
elif type -P nano &>/dev/null; then
	EDITOR=$(type -P nano)
fi
export EDITOR

# history search on up and down arrows to match what's typed already
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
# include binding for keypad arrows which may be needed in some terminals (like st)
bind '"\C-[OB": history-search-forward'
bind '"\C-[[B": history-search-forward'

# add a newline to every prompt except the first one
PROMPT_COMMAND="export PROMPT_COMMAND=echo"

# keep kitty terminfo in home dir since it's nonstandard
if [ "$TERM" = "xterm-kitty" ]; then
	TERMINFO=$HOME/.terminfo
	export TERMINFO
fi

# show a cute little box when in a container
if [ -f /run/.containerenv ]; then
	PS1=" $PS1"
fi
