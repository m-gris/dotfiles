
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

