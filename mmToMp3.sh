#!/bin/bash

numfiles=(*)
numfiles=${#numfiles[@]}
count=1

for audioFile in ./*
    do
        echo -n "Progress: $count / $numfiles" $'\r'

        avconv -loglevel 'quiet' -i "$audioFile" "${audioFile%.*}.mp3"
        rm "$audioFile"

        if [ -n "$2" ]; 
        then
            eyeD3 --artist=$1 --album=$2 "$audioFile" &>/dev/null;
        fi

        count=$((count + 1))
        sleep 0.01
    done

