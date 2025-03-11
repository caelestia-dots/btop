#!/bin/fish

set -q XDG_STATE_HOME && set -l state $XDG_STATE_HOME || set -l state $HOME/.local/state
set -l scheme_path $state/caelestia/scheme/current.txt
set -l src (dirname (status filename))/..

mkdir -p $src/themes
cp $src/template.theme $src/themes/caelestia.theme

cat $scheme_path | while read line
    set -l colour (string split ' ' $line)
    sed -i "s/\$$colour[1]/\"#$colour[2]\"/g" $src/themes/caelestia.theme
end

killall -USR2 btop 2> /dev/null
