#!/bin/bash

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    echo "$NAME is focused"
    sketchybar --set $NAME background.drawing=on background.color=0xff8aadf4
else
    sketchybar --set $NAME background.drawing=off
fi
