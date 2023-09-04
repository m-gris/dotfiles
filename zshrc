echo "Hello from .zshrc_course"


# SET VARIABLES
# CHANGE ZSH OPTIONS


# CREATE ALIASES
alias ls='ls -lAFh'


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

###########################################
# CUSTOMIZE PROMPTS - End
###########################################


# ADD LOCATIONS TO $PATH
# MARC ADD 
# make executables installed by Homebrew take precedence over system ones
# motivation: use git installed by brew instead of "system git"
export PATH="/usr/local/bin:$PATH"


###########################################
# WRITE HANDY FUNCTIONS -  Start
###########################################

function mkcd() { 
    # $@ => the arg passed to mkcd
    mkdir -p "$@" && cd "$_";
}

###########################################
# WRITE HANDY FUNCTIONS -  End
###########################################
#
# USE ZSH PLUGINS
# ... OTHER SURPRISES
