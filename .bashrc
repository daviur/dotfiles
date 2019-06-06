#!/bin/bash
# Enable vim mode
set -o vi

# Disable ctrl-s and ctrl-q
stty -ixon

# Allows you to cd into directory merely by typing the directory name.
shopt -s autocd

# Infinite history.
HISTSIZE= HISTFILESIZE=

# Set prompt
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# Set GPG agent to tty
export GPG_TTY=$(tty)

# Enable Autocompletion
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

[ -f "$HOME/.shortcuts" ] && source "$HOME/.shortcuts" # Load shortcut aliases

# System Maintainence
alias mw="~/.config/mutt/mutt-wizard.sh"
alias sdn="sudo shutdown now"
alias psref="gpg-connect-agent RELOADAGENT /bye" # Refresh gpg
alias gua="git remote | xargs -L1 git push --all"

# Some aliases
alias update="sudo apt update;sudo apt upgrade -y;sudo apt autoremove -y;sudo apt autoclean; cr"
alias e="$EDITOR"
alias SS="sudo systemctl"
alias v="$EDITOR"
alias r="ranger"
alias sr="sudo ranger"
alias ka="killall"
alias g="git"
alias trem="transmission-remote"
alias mkd="mkdir -pv"
alias ref="shortcuts >/dev/null ; source ~/.bashrc" # Refresh shortcuts manually and reload bashrc
alias mpv="mpv --input-ipc-server=/tmp/mpvsoc$(date +%s)"
alias x="sxiv -ft *"
alias l="ls -l"
alias ll="ls -al"
# Needed to handle dotfiles
alias gitd='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Adding color
alias ls="ls -hN --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ccat="highlight --out-format=ansi" # Color cat - print file with syntax highlighting.

# Internet
alias yt="youtube-dl --add-metadata -i" # Download video link
alias yta="yt -x -f bestaudio/best" # Download only audio
alias YT="youtube-viewer"

shdl() { curl -O $(curl -s http://sci-hub.tw/"$@" | grep location.href | grep -o http.*pdf) ;}
se() { du -a ~/.scripts/* ~/.config/* | awk '{print $2}' | fzf | xargs  -r $EDITOR ;}
sv() { vcopy "$(du -a ~/.scripts/* ~/.config/* | awk '{print $2}' | fzf)" ;}
vf() { fzf --no-mouse --reverse --multi --inline-info --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' | xargs -r -I % $EDITOR % ;}
cr() { [ -f /var/run/reboot-required ] && echo "Reboot required" ;}

# Fuzzi File Search
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# PyEnv
export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# fd and bat
export PATH="~/.cargo/bin:$PATH"

# Check for reboot
cr
