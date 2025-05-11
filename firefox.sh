#!/bin/bash

# Set the input as the delimiter
IFS=" "

# Prompt the user for input
read -p "Enter words (separated by spaces): " input

# Read each name into an array
read -ra names <<< "$input"

mkdir -p ~/app/firefox \
    && wget -O ~/app/firefox/firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64" \
    

for name in "${names[@]}"; do
    firefox --CreateProfile "$name $HOME/.mozilla/firefox/emet.${name}"
    #rsync -av --progress app/firefox/.mozilla/firefox/ "${HOME}/.mozilla/firefox/"

    # macOS
    #mousewheel.min_line_scroll_amount 65
    
    # KDE
    #widget.non-native-theme.gtk.scrollbar.round-thumb false
    #widget.non-native-theme.scrollbar.size.override 35

    mkdir -p ~/app/firefox/firefox-"$name" \
        && tar xjf ~/app/firefox/firefox.tar.bz2 -C ~/app/firefox/firefox-"$name" --strip-components=1
done