# Setup fzf
# ---------
if [[ ! "$PATH" == */home/diurbina/.programs/fzf/bin* ]]; then
  export PATH="$PATH:/home/diurbina/.programs/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/diurbina/.programs/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/diurbina/.fzf.functions.sh"
source "/home/diurbina/.programs/fzf/shell/key-bindings.bash"
source "/home/diurbina/.fzf.key-bindings.bash"

# Custom setup
# ------------
# Use ~~ as the trigger sequence instead of the default **
# export FZF_COMPLETION_TRIGGER='~~'

#fd options
FD_OPTIONS="--hidden --follow --exclude .git"

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# export FZF_DEFAULT_COMMAND="fd --type f --type l $FD_OPTIONS"
# export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
# export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"

# Options to fzf command
export FZF_COMPLETION_OPTS="--no-mouse --height 100% --multi --inline-info --preview '[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300'"

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
# _fzf_compgen_path() {
#   fd --hidden --follow --exclude ".git" . "$1"
# }

# # Use fd to generate the list for directory completion
# _fzf_compgen_dir() {
#   fd --type d --hidden --follow --exclude ".git" . "$1"
# }
