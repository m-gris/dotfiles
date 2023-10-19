function exists() {
    # EXPLAINING THE FUNCTION
    # `command -v` is similar to `which` (but more "robust" apparently)

    # $1 is simply the first parameter / argument passed to the function
    # in our case: the name of the command that we are checking
    
    # >/dev/null 'throws away' the stdout (1) of succesfull commands (redirecting 
    # it to /dev/null aka. the "black hole".
    
    # 2>&1 redirects stderr to the where the stdout normally goes
    # NOTA: &1 is also a 'file descriptor' for stdout, but only when it is
    # to the right of the redirection. 
    
    #### RECAP #### 
    # CHECK FOR THE EXISTENCE OF THE PASSED-IN COMMAND
    # BUT DISCARD THE OUTCOME, WHETHER SUCCES OR FAILURE, THROUGH REDIRECTION.
    # WHY ? => BECAUSE OUR SCRIPT ONLY RELIES ON THE 'EXIT CODE'
    command -v $1 1>/dev/null 2>&1
}

. "$HOME/.cargo/env"
