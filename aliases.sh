alias ls='exa -laFh --git --group-directories-first --sort=name'
alias exa='exa -laFh --git --group-directories-first --sort=name'
alias man=batman # for syntax highlighted manuals
alias sed=gsed # macOs sed != GNU-sed on other UNIX systems. Let's homogeneize
alias cd=z
alias youtube-dl="yt-dlp"  # better fork
alias bbd='brew bundle dump --force --describe'
alias sshdodo='ssh dodomac@192.168.100.60'
alias moshdodo="mosh --ssh='ssh -vv' --server='/opt/homebrew/bin/mosh-server' dodomac@192.168.100.60"
alias ppath='<<<${(F)path}' # pretty print PATH variable

# PYTHON VENVS
alias venv='source .venv/bin/activate'
alias mkv='python -m venv .venv && venv'


# Git Aliases
alias gs='git status' 
alias ga='git add' 
alias gc='git commit' 
alias gca='git commit --amend'
alias gcane='git commit --amend --no-edit' 

# Path aliases
alias cdot='cd ~/.dotfiles' 
alias cdodo='cd ~/DODOBIRD/DODO_CODE'

# TASK WARRIOR ALIASES
alias ta='task add $1' 
taskprojectfunction () {
    task $1 modify project:$2
}
alias tproj=taskprojectfunction

# PASSWORD-STORE
# the var must be set for pass-import to work
alias pass='PASSWORD_STORE_ENABLE_EXTENSIONS=true pass'

# SOURCE configs Aliases
alias zrc='source ~/.zshrc' 
alias tconf='tmux source-file ~/.config/tmux/tmux.conf'

alias deskhide='defaults write com.apple.finder CreateDesktop false; killall Finder'
alias deskshow='defaults write com.apple.finder CreateDesktop false; killall Finder'

alias v="nvim"

# FUZZY STUFFS 
#  TLDR / CHEATSHEETS
alias tldrf="tldr --list | fzf --preview 'tldr {1} --color-always' --preview-window=right,70% | xargs tldr"


alias fd="fd -HI"   # for hidden files and "git-ignored" files to be included.

alias XL='open -a "Microsoft Excel"'
