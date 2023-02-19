#!/bin/bash

# © script.quest 2023, licensed under the Mozilla Public License 2.0
# Developer: ScriptQuest Team
# Version: 1.0.0
# Last updated: 19.02.2023 (dd.mm.yyyy)
# Description: Used to set the color of the text

# Color variables
declare -A COLORS=(
    [red]='\033[0;31m'
    [green]='\033[0;32m'
    [yellow]='\033[0;33m'
    [blue]='\033[0;34m'
    [purple]='\033[0;35m'
    [cyan]='\033[0;36m'
    [default]='\033[0m'  # No Color
)

function color {
    local color=""
    local bold=""
    local reset="\033[0m"
    for (( i=1; i<=${#1}; i++ )); do
        case "${1:i-1:1}" in
            r) color="${COLORS[red]}" ;;
            g) color="${COLORS[green]}" ;;
            y) color="${COLORS[yellow]}" ;;
            b) color="${COLORS[blue]}" ;;
            p) color="${COLORS[purple]}" ;;
            c) color="${COLORS[cyan]}" ;;
            B) bold="\033[1m" ;;
            *) ;;
        esac
    done
    shift
    echo -e "${color}${bold}${*:1}${reset}"
}
