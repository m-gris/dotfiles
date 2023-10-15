
# USE exa instead of ls
alias ls='exa -laFh --git --group-directories-first --sort=name'
alias exa='exa -laFh --git --group-directories-first --sort=name'

# USE batman instead of man to have syntax highlighted manuals
alias man=batman

# Create alias to dump the Brewfile
alias bbd='brew bundle dump --force --describe'
alias sshdodo='ssh dodomac@192.168.100.60'
alias moshdodo="mosh --ssh='ssh -vv' --server='/opt/homebrew/bin/mosh-server' dodomac@192.168.100.60"

# Create alias to "pretty print" the PATH (newline per path)
alias ppath='<<<${(F)path}'

# Git Aliases
alias gs='git status' 
alias ga='git add' 
alias gc='git commit' 
alias gca='git commit --amend'
alias gcane='git commit --amend --no-edit' 

# SSH Aliases
alias cdot='cd ~/.dotfiles' 
alias cdodo='cd ~/DODOBIRD/DODO_CODE'

# TASK WARRIOR ALIASES
alias ta='task add $1' 
taskprojectfunction () {
    task $1 modify project:$2
}
alias tproj=taskprojectfunction


# SOURCE configs Aliases
alias srcz='source ~/.zshrc' 
alias srct='tmux source-file ~/.config/tmux/tmux.conf'
