#!/bin/bash

# this is jank and ugly, I know
LAYOUT="$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep "KeyboardLayout Name" | cut -c 33- | rev | cut -c 2- | rev)"

# specify short layouts individually.

if [[ $LAYOUT == "ABC" ]]; then
    SHORT_LAYOUT="En"
elif [[ $LAYOUT == "Greek" ]]; then
    SHORT_LAYOUT="λ"
elif [[ $LAYOUT == "Russian"* ]]; then
    SHORT_LAYOUT="Ru"
else
    SHORT_LAYOUT="?"
fi

sketchybar --set keyboard label="$SHORT_LAYOUT"
