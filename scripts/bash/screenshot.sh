#!/bin/bash

grim -o "$(hyprctl monitors -j | jq 'first(.[] | select(.focused == true)).name' | tr -d '"')"
