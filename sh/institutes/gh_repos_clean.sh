#!/usr/bin/env bash

# Main entry point.
function main()
{
    local INSTITUTION
    local PATH_TO_REPO

	for INSTITUTION in "${CORDEX_INSTITUTION_ID[@]}"
	do
        PATH_TO_REPO="$CORDEX_HOME/repos/institutions/$INSTITUTION"
        if [ -d "$PATH_TO_REPO" ]; then
            do_clean "$INSTITUTION" "$PATH_TO_REPO"
        fi
	done
}

function do_clean() {
    local INSTITUTION=${1}
    local PATH_TO_REPO=${2}

    pushd "$PATH_TO_REPO" || exit
    git status
    popd || exit
}

# Invoke entry point.
main
