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

fortune | cowsay
echo "======================================="

alias vpn='/opt/cisco/anyconnect/bin/vpn'
alias vpnui='/opt/cisco/anyconnect/bin/vpnui'
alias tmux='TERM=xterm-256color tmux'
alias runelite='java -jar /usr/local/bin/RuneLite.jar'

export EDITOR='/usr/bin/vim'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/markus/Apps/Anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/markus/Apps/Anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/markus/Apps/Anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/markus/Apps/Anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# TMC autocomplete for University of Helsinki submission program
#source /home/markus/.tmc-autocomplete.sh || true
#source /home/markus/.tmc-autocomplete.sh || true

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
