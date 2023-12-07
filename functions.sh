
# Make Dir & CD into it
function mkcd() { 
    # $@ => the arg passed to mkcd
    mkdir -p "$@" && \cd "$_";
}

# GET KEYS FROM INI FILE (EX. gitconfig ...)
function parse_ini() {
  sed -n "/\[$1\]/,/\[.*\]/p" ~/.gitconfig | sed '$d'
}

function docker_find_image() {
    docker images | head -n 1 && docker images | grep $1
}

function fuzzy_dirs() {
    (fd --type d | fzf)
}


function fuzzy_json() {
    echo '' | fzf-tmux -p '80%' --print-query --preview "cat ${1} | jq {q}"
}

function my_select_col() {
    # XSV SELECT COLUMNS
    xsv headers $1 | awk '{print $2}' | fzf

}

function kitty_theme() {
    # will apply a color theme to a single window
    kitty +kitten themes $1
}

function kitty_all_theme() {
    # will apply a color theme to ALL windows
    kitty +kitten themes --reload-in=all $1
}


function auto_activate_venv() {
  if [[ -d ".venv" ]]; then
    source .venv/bin/activate
  fi
}


# CLOJURE REPL: syntax highlighting, autcompletion etc... 
# Add these to your .bash_profile / .zshrc / etc.

# Starts a Clojure repl
function rebel-clj() {
  clojure -Sdeps "{:deps {com.bhauman/rebel-readline {:mvn/version \"0.1.4\"} $@}}" -m rebel-readline.main
}

# Starts a browser REPL
function rebel-cljs() {
  clojure -Sdeps "{:deps {com.bhauman/figwheel-main {:mvn/version \"0.1.7\"} com.bhauman/rebel-readline-cljs {:mvn/version \"0.1.4\"} $@}}" -m figwheel.main
}


function timewarrior_timer {
    # timewarrior_timer: Automates task timing with Timewarrior and notifies on completion.
    duration=$(( $1 * 60 )) # Convert minutes to seconds
    shift # Remove the first argument (duration)

    # Start Timewarrior task with remaining arguments as tags
    timew start "$@" #> /dev/null

    # Wait for the specified duration
    sleep $duration

    # Stop Timewarrior task
    timew stop #> /dev/null

    # macOS notification
    osascript -e "display notification \"Timer completed for task: $@\" with title \"Timewarrior Timer\""
    afplay /System/Library/Sounds/Glass.aiff
}


auto_change_background_color() {
    if [[ -f "$PWD/.background_color.sh" ]]; then
        source "$PWD/.background_color.sh"
    fi
}

function zcd() {
    if [[ $1 == -* ]] || [[ -z $1 ]]; then
        # Use zoxide for flags or no arguments
        zoxide "$@"
    elif [[ -d $1 ]] || [[ $1 == /* ]] || [[ $1 == ~* ]]; then
        # Fallback to builtin cd for absolute, home, and existing paths
        builtin cd "$@"
    else
        # Use zoxide query for other cases, fallback to builtin cd if no result
        local dir=$(zoxide query "$@" 2> /dev/null)
        if [[ -n $dir ]]; then
            builtin cd "$dir"
        else
            echo "zoxide: no match found for $@"
        fi
    fi
}




# TEST 
# FZF Docker Integration
FZF_DOCKER_PS_FORMAT="table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Ports}}"
FZF_DOCKER_PS_START_FORMAT="table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Image}}"

_fzf_complete_docker() {
  local DOCKER_COMMANDS
  DOCKER_COMMANDS=$(docker --help 2>&1 >/dev/null |
    sed -n -e '/Management Commands:/,$p' |
    grep -v "Management Commands:" |
    grep -v "Commands:" |
    grep -v 'COMMAND --help' |
    grep .
  )

  local ARGS="$@"
  if [[ $ARGS == 'docker ' ]]; then
    _fzf_complete "--reverse -n 1 --height=80%" "$@" < <(
      echo $DOCKER_COMMANDS
    )
  elif [[ $ARGS == 'docker tag'* || $ARGS == 'docker -f'* || $ARGS == 'docker run'* || $ARGS == 'docker push'* ]]; then
    _fzf_complete "--multi --header-lines=1" "$@" < <(
      docker images --format "table {{.Repository}}:{{.Tag}}\t{{.Size}}\t{{.ID}}\t{{.CreatedSince}}"
    )
  elif [[ $ARGS == 'docker rmi'* ]]; then
    _fzf_complete "--multi --header-lines=1" "$@" < <(
      docker images --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.Size}}"
    )
  elif [[ $ARGS == 'docker stop'* || $ARGS == 'docker rm'* || $ARGS == 'docker exec'* || $ARGS == 'docker kill'* || $ARGS == 'docker restart'* || $ARGS == 'docker logs'* ]]; then
    _fzf_complete "--multi --header-lines=1" "$@" < <(
      docker ps --format "${FZF_DOCKER_PS_FORMAT}"
    )
  elif [[ $ARGS == 'docker start'* ]]; then
    _fzf_complete "--multi --header-lines=1" "$@" < <(
      docker ps -a --format "${FZF_DOCKER_PS_START_FORMAT}"
    )
  fi
}

_fzf_complete_docker_post() {
  awk '{print $1}'
}

# Register the completion function for docker command
compdef _fzf_complete_docker docker



runc() {
  # source: https://calbertts.medium.com/docker-and-fuzzy-finder-fzf-4c6416f5e0b5
  export FZF_DEFAULT_OPTS='--height 90% --reverse --border'
  local image=$(docker images --format '{{.Repository}}:{{.Tag}}' | fzf-tmux --reverse --multi)
  if [[ $image != '' ]]; then
    echo -e "\n  \033[1mDocker image:\033[0m" $image
    read -e -p $'  \e[1mOptions: \e[0m' -i "-it --rm" options

    printf "  \033[1mChoose the command: \033[0m"
    local cmd=$(echo -e "/bin/bash\nsh" | fzf-tmux --reverse --multi)
    if [[ $cmd == '' ]]; then
        read -e -p $'  \e[1mCustom command: \e[0m' cmd
    fi
    echo -e "  \033[1mCommand: \033[0m" $cmd

    export FZF_DEFAULT_COMMAND='find ./ -type d -maxdepth 1 -exec basename {} \;'
    printf "  \033[1mChoose the volume: \033[0m"
    local volume=$(fzf-tmux --reverse --multi)
    local curDir=${PWD##*/}
    if [[ $volume == '.' ]]; then
        echo -e "  \033[1mVolume: \033[0m" $volume
        volume="`pwd`:/$curDir -w /$curDir"
    else
        echo -e "  \033[1mVolume: \033[0m" $volume
        volume="`pwd`/$volume:/$volume -w /$volume"
    fi

    export FZF_DEFAULT_COMMAND=""
    export FZF_DEFAULT_OPTS=""

    history -s runc
    history -s docker run $options -v $volume $image $cmd
    echo ''
    docker run $options -v $volume $image $cmd
  fi
}

runinc() {
  # source: https://calbertts.medium.com/docker-and-fuzzy-finder-fzf-4c6416f5e0b5
  export FZF_DEFAULT_OPTS='--height 90% --reverse --border'
  local container=$(docker ps --format '{{.Names}} => {{.Image}}' | fzf-tmux --reverse --multi | awk -F '\\=>' '{print $1}')
  if [[ $container != '' ]]; then
    echo -e "\n  \033[1mDocker container:\033[0m" $container
    read -e -p $'  \e[1mOptions: \e[0m' -i "-it" options
    if [[ $@ == '' ]]; then
				read -e -p $'  \e[1mCommand: \e[0m' cmd
    else
				cmd="$@"
    fi
    echo ''
    history -s runinc "$@"
    history -s docker exec $options $container $cmd
    docker exec $options $container $cmd
    echo ''
  fi
  export FZF_DEFAULT_OPTS=""
}

showipc() {
  export FZF_DEFAULT_OPTS='--height 90% --reverse --border'
  local container=$(docker ps -a --format '{{.Names}} => {{.Image}}' | fzf-tmux --reverse --multi | awk -F '\\=>' '{print $1}')

  if [[ $container != '' ]]; then
    local network=$(docker inspect $container -f '{{.NetworkSettings.Networks}}' | awk -F 'map\\[|:' '{print $2}')
    echo -e "\n  \033[1mDocker container:\033[0m" $container
    history -s showipc
    history -s docker inspect -f "{{.NetworkSettings.Networks.${network}.IPAddress}}" $container
    echo -e "  \033[1mNetwork:\033[0m" $network
    echo -e "  \033[1mIP Address:\033[0m" $(docker inspect -f "{{.NetworkSettings.Networks.${network}.IPAddress}}" $container) "\n"
  fi
}

function fdex() {
    # source: https://rafaelleru.github.io/wiki/fuzzy_docker/
	CONTAINER=`docker ps | rg -v CONTAINER | awk '-F ' ' {print $NF}' | fzf`
	if [ ! -z $CONTAINER ]
	then
		docker exec -it $CONTAINER bash
	fi
}


function fdlog() {
    # source;https://rafaelleru.github.io/wiki/fuzzy_docker/
	CONTAINER=`docker ps | rg -v CONTAINER | awk '-F ' ' {print $NF}' | fzf`
	if [ ! -z $CONTAINER ]
	then
		docker logs -f $CONTAINER
	fi
}

