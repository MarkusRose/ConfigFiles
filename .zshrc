# Created by newuser for 5.4.2
#
# History
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=5000
HISTSIZE=2000
unsetopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
bindkey "$key[Up]" history-search-backward
bindkey "$key[Down]" history-search-forward

setopt CORRECT
#setopt CORRECT_ALL

if [ -e /etc/zsh_command_not_found ];then
    source /etc/zsh_command_not_found
fi

PROMPT="%(?.%F{green}√.%F{red}?%?)%f %B%F{024}%2~%f%b %(!.#.>) "
RPROMPT='%*'

#Color syntax highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias ls='ls --color=auto'

#fortune | cowsay
#echo "======================================="

export EDITOR='/usr/bin/vim'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
