
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
auto_change_background_color() {
    if [[ -f "$PWD/.background_color.sh" ]]; then
        source "$PWD/.background_color.sh"
    fi
}

