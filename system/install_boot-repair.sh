#!/bin/bash

#/**
# * boot-repair
# * repair boot manager
# *
# * @category system
# */

BASEDIR=$(dirname "${0}")
. ${BASEDIR}/../tools/colors.sh

if [ "${#}" -gt 1 ]; then
    echo_error "too many arguments (${#})"
    echo_label 'usage'; echo_primary "`basename ${0}` -n (no update) -h (help)"
    exit 1
fi

OPTIND=0
while getopts :nh OPTION; do
    case "${OPTION}" in
        n) UPDATE='false';;
        h) echo_label 'description'; echo_primary "`basename ${0}`"
            echo_label 'usage'; echo_primary "`basename ${0}` -n (no update) -h (help)"
            exit 0;;
        \?) echo_error "invalid option \"${OPTARG}\""
            exit 1;;
    esac
done

if [ "${UPDATE}" != 'false' ]; then
    echo_info 'sudo add-apt-repository -y ppa:yannubuntu/boot-repair'
    sudo add-apt-repository -y ppa:yannubuntu/boot-repair

    echo_info 'sudo apt-get update'
    sudo apt-get update
fi

echo_info 'sudo apt-get install --assume-yes boot-repair'
sudo apt-get install --assume-yes boot-repair
