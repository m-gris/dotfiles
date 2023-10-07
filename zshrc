echo "Hello from .zshrc_course"
echo "Hello from .zshrc"

###########################################
# SET VARIABLES - Start
###########################################

# Use bat for syntax highlighting of man pages

# COMMENTED: we will alias the man command with batman
#export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export HOMEBREW_CASK_OPTS="--no-quarantine" # bypass / turn off macos Gatekeeper

# Warning: Homebrew's "sbin" was not found in your PATH 
# but you have installed formulae that put executables in /usr/local/sbin.
#Consider setting your PATH for example like so:
#  echo 'export PATH="/usr/local/sbin:$PATH"' >> ~/.zshrc
export PATH="/usr/local/sbin:$PATH"


###########################################
# SET VARIABLES - End
###########################################




###########################################
# CREATE ALIASES - Start
###########################################
# USE exa instead of ls
alias ls='exa -laFh --git'
alias exa='exa -laFh --git'

# USE batman instead of man to have syntax highlighted manuals
alias man=batman

# Create alias to dump the Brewfile
alias bbd='brew bundle dump --force --describe'

# Create alias to "pretty print" the PATH (newline per path)
alias ppath='<<<${(F)path}'

# Git Aliases
alias gs='git status' 
alias ga='git add' 
alias gc='git commit' 
alias gca='git commit --amend'
alias gcane='git commit --amend --no-edit' 


###########################################
# CREATE ALIASES - End
###########################################


###########################################
# CUSTOMIZE PROMPTS - Start
###########################################
# Left prompt
# %n => user
# %m => host
# %L prints SHLVL, i.e the shell level
# %1~ => use tilde for home dir
# %# => end the prompt with percent sign
PROMPT=' 
%1~ %L $
'

# right prompt 
# %* => time of cmd execution
RPROMPT='%*'

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# CUSTOMIZE PROMPTS - End
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



###########################################
# ADD LOCATIONS TO $PATH - Start
###########################################

# MARC ADD 
# make executables installed by Homebrew take precedence over system ones
# motivation: use git installed by brew instead of "system git"
export PATH="/usr/local/bin:$PATH"


# Add Visual Studio Code (code)
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

###########################################
# ADD LOCATIONS TO $PATH - Start
###########################################



###########################################
# WRITE HANDY FUNCTIONS -  Start
###########################################

# Make Dir & CD into it
function mkcd() { 
    # $@ => the arg passed to mkcd
    mkdir -p "$@" && cd "$_";
}

# GET KEYS FROM INI FILE (EX. gitconfig ...)
function parse_ini() {
  sed -n "/\[$1\]/,/\[.*\]/p" ~/.gitconfig | sed '$d'
}

###########################################
# WRITE HANDY FUNCTIONS -  End
###########################################
#
# USE ZSH PLUGINS
# ... OTHER SURPRISES
#

############################################
## Marc Add-ons
############################################

# Enable extended pattern matching features in Zsh
# Allows use of advanced globbing patterns like !(pattern) for negation
setopt extendedglob

# LAUNCH TMUX AUTOMATICALLY
if [ "$TMUX" = "" ]; then tmux; fi

# VIM MOTIONS 
bindkey -v
VI_MODE_SET_CURSOR=true

# from https://github.com/jeffreytse/zsh-vi-mode
# installed via brew
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh


###############################################################################
########### NEOVIM CONFIG SWITCHER - Start
###############################################################################
# Source: https://www.youtube.com/watch?v=LkHjJlSgKZY
# https://gist.github.com/elijahmanor/b279553c0132bfad7eae23e34ceb593b
# LEVERAGES THE FOLLOWING FEATURE 
# https://github.com/neovim/neovim/pull/22128
alias nvim-lazy="NVIM_APPNAME=PrimeVim nvim"
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-kick="NVIM_APPNAME=KickStart nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"

function nvims() {
  items=("default" "PrimeVim" "KickStart" "LazyVim" "NvChad" "AstroNvim" "NeuralNineVim")
  # USE FZF
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)

  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  #
  # SET THE NVIM APP NAME ACCORDINGLY
  NVIM_APPNAME=$config nvim $@
}

## Launch nvim switcher with ctrl-a
# bindkey -s ^a "nvims\n"

###############################################################################
########### NEOVIM CONFIG SWITCHER - End 
###############################################################################





## If you come from bash you might have to change your $PATH.
## export PATH=$HOME/bin:/usr/local/bin:$PATH

## Path to your oh-my-zsh installation.
#export ZSH="$HOME/.oh-my-zsh"

## Set name of the theme to load --- if set to "random", it will
## load a random theme each time oh-my-zsh is loaded, in which case,
## to know which specific one was loaded, run: echo $RANDOM_THEME
## See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
## ZSH_THEME="pygmalion" # USE CATCUPCCIN INSTEAD

## STILL SOME ISSUES WITH powerlevel10k 
##ZSH_THEME="powerlevel10k/powerlevel10k"


## Set list of themes to pick from when loading at random
## Setting this variable when ZSH_THEME=random will cause zsh to load
## a theme from this variable instead of looking in $ZSH/themes/
## If set to an empty array, this variable will have no effect.
## ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

## Uncomment the following line to use case-sensitive completion.
## CASE_SENSITIVE="true"

## Uncomment the following line to use hyphen-insensitive completion.
## Case-sensitive completion must be off. _ and - will be interchangeable.
## HYPHEN_INSENSITIVE="true"

## Uncomment one of the following lines to change the auto-update behavior
## zstyle ':omz:update' mode disabled  # disable automatic updates
## zstyle ':omz:update' mode auto      # update automatically without asking
## zstyle ':omz:update' mode reminder  # just remind me to update when it's time

## Uncomment the following line to change how often to auto-update (in days).
## zstyle ':omz:update' frequency 13

## Uncomment the following line if pasting URLs and other text is messed up.
## DISABLE_MAGIC_FUNCTIONS="true"

## Uncomment the following line to disable colors in ls.
## DISABLE_LS_COLORS="true"

## Uncomment the following line to disable auto-setting terminal title.
## DISABLE_AUTO_TITLE="true"

## Uncomment the following line to enable command auto-correction.
## ENABLE_CORRECTION="true"

## Uncomment the following line to display red dots whilst waiting for completion.
## You can also set it to another string to have that shown instead of the default red dots.
## e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
## Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
## COMPLETION_WAITING_DOTS="true"

## Uncomment the following line if you want to disable marking untracked files
## under VCS as dirty. This makes repository status check for large repositories
## much, much faster.
## DISABLE_UNTRACKED_FILES_DIRTY="true"

## Uncomment the following line if you want to change the command execution time
## stamp shown in the history command output.
## You can set one of the optional three formats:
## "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
## or set a custom format using the strftime function format specifications,
## see 'man strftime' for details.
## HIST_STAMPS="mm/dd/yyyy"

## Would you like to use another custom folder than $ZSH/custom?
## ZSH_CUSTOM=/path/to/new-custom-folder

## Which plugins would you like to load?
## Standard plugins can be found in $ZSH/plugins/
## Custom plugins may be added to $ZSH_CUSTOM/plugins/
## Example format: plugins=(rails git textmate ruby lighthouse)
## Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  vi-mode)
#  zsh-interactive-cd
#  zsh-syntax-highlighting
#  #zsh-autosuggestions
#  python
#  # poetry
#  pyenv
#  docker
#  docker-compose
#)



## User configuration

## export MANPATH="/usr/local/man:$MANPATH"

## You may need to manually set your language environment
## export LANG=en_US.UTF-8

## Preferred editor for local and remote sessions
## if [[ -n $SSH_CONNECTION ]]; then
##   export EDITOR='vim'
## else
##   export EDITOR='mvim'
## fi

## Compilation flags
## export ARCHFLAGS="-arch x86_64"

## Set personal aliases, overriding those provided by oh-my-zsh libs,
## plugins, and themes. Aliases can be placed here, though oh-my-zsh
## users are encouraged to define aliases within the ZSH_CUSTOM folder.
## For a full list of active aliases, run `alias`.
##
## Example aliases
## alias zshconfig="mate ~/.zshrc"
## alias ohmyzsh="mate ~/.oh-my-zsh"

## FOR GIT BARE REPO FOR DOTFILES 
## SOURCE: https://www.youtube.com/watch?v=tBoLDpTWVOM
## alias dots='/usr/bin/git --git-dir=/Users/marc/dotfiles/ --work-tree=/Users/marc'






##### POETRY
## export PATH="$HOME/.local/bin/poetry:$PATH"    # $HOME not interpolated properly
#export PATH="/Users/marc/.local/bin:$PATH"
######


##### PYTHON / PYENV 
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#export PIPENV_PYTHON="$PYENV_ROOT/shims/python"

#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
#####


##### Start: FROM: https://engineeringfordatascience.com/posts/configure_terminal_for_data_science_with_oh_my_zsh/
## # need to disable in order for exa ls alias to work
##DISABLE_LS_COLORS="true"
## FZF settings
## export FZF_BASE="$HOME/.fzf"
## export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore --files -g "!.git/"'
## export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
## export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
## # ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"
## # map exa commands to normal ls commands
## alias ll="exa -l -g --icons"
## alias ls="exa --icons"
## alias lt="exa --tree --icons -a -I '.git|__pycache__|.mypy_cache|.ipynb_checkpoints'"
## # show file previews for fzf using bat
## alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
## use bat instead of cat (syntax highlighting)
## alias cat="bat"
####
##### End: FROM: https://engineeringfordatascience.com/posts/configure_terminal_for_data_science_with_oh_my_zsh/



#### STARSHIP => Customize the Prompt 
##eval "$(starship init zsh)"
##[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## CUSTOMIZING THE PROMPT WITHOUT STARSHIP ABOVE... 
## In this prompt, 
## %n displays the username, 
## %m displays the machine name, 
## %~ displays the current working directory, 
## and the $(git branch ...) command displays the current git branch (if you are in a git repository).
## PROMPT='%F{green}%n%f@%F{blue}%m%f:%F{yellow} %<...<%3~%f | %B%F{red}$(basename $VIRTUAL_ENV 2>/dev/null)%f%b $(git branch 2>/dev/null | grep \* | cut -d " " -f2) $ '



#export PATH="$PATH:/Users/marc/Documents/DATA_PROG/SCRIPTS_AND_AUTOMATIONS"


## CUSTOMER ENV VARIABLES 
#export DODO_DATA_DIR=/Users/marc/DODOBIRD/DATASETS/REES46

## CUSTOM "CLI COMMANDS" FROM PYTHON SCRIPTS
#replace_whitespace() {
#    python3 ~/Documents/DATA_PROG/SCRIPTS_AND_AUTOMATIONS/replace_whitespaces.py "$@"
#}

## HOOK direnv to zsh shell 
## https://direnv.net/docs/hook.html
## direnv is an extension for your shell. 
## It augments existing shells with a new feature that can load and unload environment variables depending on the current directory.
#eval "$(direnv hook zsh)"

# export NVM_DIR="$HOME/.nvm"
#  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


## # >>> conda initialize >>>
## # !! Contents within this block are managed by 'conda init' !!
## __conda_setup="$('/Users/marc/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
## if [ $? -eq 0 ]; then
##     eval "$__conda_setup"
## else
##     if [ -f "/Users/marc/miniconda3/etc/profile.d/conda.sh" ]; then
##         . "/Users/marc/miniconda3/etc/profile.d/conda.sh"
##     else
##         export PATH="/Users/marc/miniconda3/bin:$PATH"
##     fi
## fi
## unset __conda_setup
## # <<< conda initialize <<<


#source $ZSH/oh-my-zsh.sh
