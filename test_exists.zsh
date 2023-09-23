#!/usr/bin/env zsh


echo "\n<<< Running $0 >>>\n"

exists brew && echo "excellent: brew exists" || echo "bogus: brew does not exists"
exists nonexistent && echo "excellent: nonexistent exists" || echo "bogus: nonexistent does not exists"

which exists

