###########################################
# VARIABLES 
###########################################

export HOMEBREW_CASK_OPTS="--no-quarantine" # bypass / turn off macos Gatekeeper

# Warning: Homebrew's "sbin" was not found in your PATH 
# but you have installed formulae that put executables in /usr/local/sbin.
#Consider setting your PATH for example like so:
#  echo 'export PATH="/usr/local/sbin:$PATH"' >> ~/.zshrc
export PATH="/usr/local/sbin:$PATH"

# NULCMD is the command used for redirection (heredoc, herewords)
# when no command is specified. Defaults to `cat`
export NULLCMD=bat

###########################################
# SET VARIABLES - End
###########################################


# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "zap-zsh/supercharge"
plug "zap-zsh/completions"
plug "zsh-users/zsh-syntax-highlighting"
plug "hlissner/zsh-autopair"

plug "Aloxaf/fzf-tab"

# I DO NOT LIKE THESE 2: 
# CREATES TOO MUCH NOISE & AGITATION ON THE SCREEN
# plug 'marlonrichert/zsh-autocomplete'
#plug "zsh-users/zsh-autosuggestions"

# TOO SLOW ...
# plug "zap-zsh/zap-prompt"

###########################################
# ALIASES 
source ~/.dotfiles/aliases.sh
alias ls='exa -laFh --git'
###########################################


###########################################
# FUNCTIONS 
source ~/.dotfiles/functions.sh
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

# ABOVE OVERRIDEN BY STARSHIP
eval "$(starship init zsh)"

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



############################################
## Marc Add-ons
############################################

# Enable extended pattern matching features in Zsh
# Allows use of advanced globbing patterns like !(pattern) for negation
setopt extendedglob

# LAUNCH TMUX AUTOMATICALLY
if [ "$TMUX" = "" ]; then tmux; fi

###############################################################################
########### NEOVIM CONFIG SWITCHER - Start
###############################################################################
# Source: https://www.youtube.com/watch?v=LkHjJlSgKZY
# https://gist.github.com/elijahmanor/b279553c0132bfad7eae23e34ceb593b
# LEVERAGES THE FOLLOWING FEATURE 
# https://github.com/neovim/neovim/pull/22128
# alias nvim="NVIM_APPNAME=PrimeVim nvim"

alias nvim-scratch="NVIM_APPNAME=neovim-from-scratch nvim"
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-kick="NVIM_APPNAME=KickStart nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"

function nvims() {
    items=("default" "Scratch" ) ##  "KickStart" "LazyVim" "NvChad" "AstroNvim" "NeuralNineVim")
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

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

#### POETRY
# export PATH="$HOME/.local/bin/poetry:$PATH"    # $HOME not interpolated properly
export PATH="/Users/marc/.local/bin:$PATH"
######


#### PYTHON / PYENV 
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


export PATH="$PATH:/Users/marc/Documents/DATA_PROG/SCRIPTS_AND_AUTOMATIONS"


## CUSTOMER ENV VARIABLES 
#export DODO_DATA_DIR=/Users/marc/DODOBIRD/DATASETS/REES46

# CUSTOM "CLI COMMANDS" FROM PYTHON SCRIPTS
replace_whitespace() {
    python3 ~/Documents/DATA_PROG/SCRIPTS_AND_AUTOMATIONS/replace_whitespaces.py "$@"
}

# HOOK direnv to zsh shell 
# https://direnv.net/docs/hook.html
# direnv is an extension for your shell. 
# It augments existing shells with a new feature that can load and unload environment variables depending on the current directory.
eval "$(direnv hook zsh)"

# Created by `pipx` on 2023-10-12 05:12:32
export PATH="$PATH:/Users/marc/.local/bin"

# for fzf key-bindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# opam configuration
[[ ! -r /Users/marc/.opam/opam-init/init.zsh ]] || source /Users/marc/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null


source ~/.dotfiles/zoxide-config.sh



# Initialize Zsh completion system
autoload -Uz compinit
compinit

# for pipx autocompletion
autoload -U bashcompinit
bashcompinit
eval "$(register-python-argcomplete pipx)"




