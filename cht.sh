#!/usr/bin/env bash

languages=`echo "python sql bash ocaml clojure lua golang" | tr ' ' '\n'`

core_utils=`echo "find fd rg sed grep awk mv" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf`


if [[ -z $selected ]]; then
    echo "$selected is not an available choice"
    exit 0
fi

read -p "Enter Query: " query

if [[ -z $query ]]; then
    tmux neww bash -c "curl cht.sh/$selected & while [ : ]; do sleep 1; done"
else
    if printf $languages | grep -qs $selected; then
        tmux neww bash -c "curl cht.sh/$selected/`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1; done"
    else
        tmux neww bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
    fi
fi

