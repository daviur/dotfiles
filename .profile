#!/bin/bash
# Profile file. Runs on login.

SYSRESOURCES=/etc/X11/Xresources
USRRESOURCES=$HOME/.Xresources

# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':')"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export FILE="ranger"
export BIB="$HOME/Documents/LaTeX/uni.bib"
export SUDO_ASKPASS="$HOME/.scripts/tools/dmenupass"
export PIX="$HOME/.pix/"
export GOPATH="$HOME/go"

[ ! -f ~/.shortcuts ] && shortcuts >/dev/null 2>&1

echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

# Switch escape and caps if tty:
sudo -n loadkeys ~/.scripts/ttymaps.kmap 2>/dev/null

# Init SSH agent and add key
[ ! $SSH_AGENT_PID ] && eval "$(ssh-agent -s)"
ssh-add .ssh/id_rsa > /dev/null 2>&1

cr() { [ -f /var/run/reboot-required ] && echo "Reboot required" ;}
cr

# Start graphical server if i3 not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx
