#!/bin/bash

#/**
# * audacity
# *
# * @category multimedia
# * @note     Shift + play button to loop selection
# */

BASEDIR=$(dirname "${0}")
. ${BASEDIR}/../tools/colors.sh

echo_info 'sudo apt-get install --assume-yes audacity'
sudo apt-get install --assume-yes audacity
