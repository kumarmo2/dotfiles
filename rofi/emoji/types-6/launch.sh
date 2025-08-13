#!/usr/bin/env bash
dir="$HOME/.config/rofi/emoji/types-6"
theme='style-5'

## Run
rofi \
    -show emoji \
    -theme ${dir}/${theme}.rasi
