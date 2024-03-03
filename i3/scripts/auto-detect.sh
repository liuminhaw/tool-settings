#!/bin/bash
# This script is used to automatically detect and configure the displays
# Note: use `xrandr -q` to get the display names

if [[ ${#} -eq 1 && "${1}" == "normal" ]]; then
    _detected_displays=()
else
    read -r -d ' ' -a _detected_displays <<< "$(xrandr -q | grep " connected " | grep -v "eDP-1" | cut -d ' ' -f1)"
fi
read -r -d ' ' -a _displays <<< "$(xrandr -q | grep "connected" | grep -v "eDP-1" | cut -d ' ' -f1)"

if [[ ${#_detected_displays[@]} -eq 1 ]]; then
    _arguments="--output eDP-1 --off"
    for _display in "${_displays[@]}"; do
        if [[ "${_display}" == "${_detected_displays[0]}" ]]; then
            _arguments="${_arguments} --output ${_display} --primary --mode 1920x1080 --pos 0x0 --rotate normal"
        else
            _arguments="${_arguments} --output ${_display} --off"
        fi
    done
else
    _arguments="--output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal"
    for _display in "${_displays[@]}"; do
        _arguments="${_arguments} --output ${_display} --off"
    done
fi

# For debugging
# echo "xrandr ${_arguments}"
# Actual command
xrandr ${_arguments}


