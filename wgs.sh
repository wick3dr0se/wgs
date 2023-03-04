#!/bin/bash

set -eEuo pipefail

input=
api='https://source.unsplash.com/random'
wallpaper='.wgs'

hash(){ builtin hash "$1" 2>/dev/null; }

getter(){ curl -sL "$api"/?"${input%,}" -o ~/"$wallpaper"; }

setter(){
  if hash xwallpaper; then
    xwallpaper --zoom ~/"$wallpaper"
  elif hash feh; then
    feh --bg-fill ~/"$wallpaper"
  elif hash nitrogen; then
    nitrogen --set-zoom-fill ~/"$wallpaper"
  elif hash gsettings; then
    gsettings set org.gnome.desktop.background picture-uri ~/"$wallpaper"
  fi
}

for _; do
  if [[ ${_%:*} == -a ]]; then
    [[ $_ =~ : ]]&& interval="${_#*:}"
    interval="${interval:-30}"
  elif [[ ${_%:*} == -o ]]; then
    wallpaper="${_#*:}"
  else
    input+="$_,"
  fi
done

if (( ${interval-} )); then
  for((;;)){
    getter; setter
    sleep "$interval"
  }
else
  getter; setter
fi
