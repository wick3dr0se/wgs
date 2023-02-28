#!/bin/bash

set -eEuo pipefail

getter(){ curl -sL "$api"/?"${input// /,}" -o ~/.wgs; }

setter(){ xwallpaper --zoom ~/.wgs; }

[[ ${1-} == -a ]]&&{ interval="$2"; shift 2; }

input="$*" api='https://source.unsplash.com/random'

if (( ${interval-} )); then
  for((;;)){
    getter; setter
    sleep "$interval"
  }
else
  getter; setter
fi
