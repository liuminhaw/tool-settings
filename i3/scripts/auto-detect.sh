#!/bin/bash
# This script is used to automatically detect and configure the displays
# Note: use `xrandr -q` to get the display names

_BUILTIN_DISPLAY="eDP"
_BUILTIN_DISPLAY_RESOLUTION="1920x1200"
_EXTERNAL_DISPLAY_RESOLUTION="1920x1080"

if [[ ${#} -eq 1 && "${1}" == "normal" ]]; then
    _detected_displays=()
else
    read -r -d ' ' -a _detected_displays <<< "$(xrandr -q | grep " connected " | grep -v "${_BUILTIN_DISPLAY}" | cut -d ' ' -f1)"
fi
read -r -d ' ' -a _displays <<< "$(xrandr -q | grep "connected" | grep -v "${_BUILTIN_DISPLAY}" | cut -d ' ' -f1)"

if [[ ${#_detected_displays[@]} -eq 1 ]]; then
    _arguments="--output ${_BUILTIN_DISPLAY} --off"
    for _display in "${_displays[@]}"; do
        if [[ "${_display}" == "${_detected_displays[0]}" ]]; then
            _arguments="${_arguments} --output ${_display} --primary --mode ${_EXTERNAL_DISPLAY_RESOLUTION} --pos 0x0 --rotate normal"
        else
            _arguments="${_arguments} --output ${_display} --off"
        fi
    done
else
    _arguments="--output ${_BUILTIN_DISPLAY} --mode ${_BUILTIN_DISPLAY_RESOLUTION} --pos 0x0 --rotate normal"
    for _display in "${_displays[@]}"; do
        _arguments="${_arguments} --output ${_display} --off"
    done
fi

# For debugging
# echo "xrandr ${_arguments}"
# Actual command
xrandr ${_arguments}


