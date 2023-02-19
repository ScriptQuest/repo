#!/bin/bash

# © script.quest 2023, licensed under the Mozilla Public License 2.0
# Developer: ScriptQuest Team
# Version: 1.0.0
# Last updated: 19.02.2023 (dd.mm.yyyy)
# Description: Install missing dependencies required by scripts.

source "color.sh"

function check {
    local exit_status=0
    for pkg in "$@"; do
        if ! dpkg -s "$pkg" >/dev/null 2>&1; then
            read -rp "$(color bB "INFO ") Package '$pkg' is not installed. Do you want to install it? [Y/n] " choice
            case "$choice" in
                y|Y|"") echo "Installing package, please wait..." && sudo apt-get install "$pkg" -qy && echo "Installation finished!" ;;
                n|N) echo "$(color rB "ERROR") Installation is required to continue - exiting script." && exit_status=1 && exit 1 ;;
                *) echo "Invalid choice. Aborting." >&2; exit 1 ;;
            esac
        fi
    done
    return $exit_status
}