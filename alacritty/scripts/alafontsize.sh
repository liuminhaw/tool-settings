#! /bin/bash
#
# This script is used to change the font size of the terminal in the alacritty.yml file

_ALACRITTY_CONFIG="${HOME}/.config/alacritty/alacritty.yml"

# Check user input
if [[ ${#} -ne 1 ]]; then
    echo "Usage: alfontsize.sh <font size>"
    exit 1
fi
_font_size=${1}

# Check if the font size is a number
if [[ ! ${_font_size} =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "The font size must be a number"
    exit 1
fi

# Check if font size setup exist in the file
if [[ $(grep -c "  size: " ${_ALACRITTY_CONFIG}) -ne 1 ]]; then
    echo "The font size setup does not exist in the file or exist multiple times"
    exit 1
fi

# Backup config file
cp ${_ALACRITTY_CONFIG} ${_ALACRITTY_CONFIG}.bak

# Change font size
sed -E "s/  size: [0-9]*\.?[0-9]*/  size: ${_font_size}/" ${_ALACRITTY_CONFIG} > ${_ALACRITTY_CONFIG}.tmp
cat ${_ALACRITTY_CONFIG}.tmp > ${_ALACRITTY_CONFIG}

echo "Font size changed to ${_font_size}"

# Remove temporary file
rm ${_ALACRITTY_CONFIG}.tmp
