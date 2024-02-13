#!/usr/bin/bash

function gitpagediff() {
    DIFF_ARGS="$1"
    git diff --name-only |
        while read filename; do
            difffile=/tmp/$(basename $filename)
            git diff --color=always $DIFF_ARGS $filename > $difffile
            echo $difffile
        done | xargs less -i
}
