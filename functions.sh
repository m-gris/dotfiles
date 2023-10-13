
# Make Dir & CD into it
function mkcd() { 
    # $@ => the arg passed to mkcd
    mkdir -p "$@" && cd "$_";
}

# GET KEYS FROM INI FILE (EX. gitconfig ...)
function parse_ini() {
  sed -n "/\[$1\]/,/\[.*\]/p" ~/.gitconfig | sed '$d'
}

function docker_find_image() {
    docker images | head -n 1 && docker images | grep $1
}

