#!/bin/sh
echo -ne '\033c\033]0;Vampire Survivors Clone\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Vampire Survivors Clone.x86_64" "$@"
