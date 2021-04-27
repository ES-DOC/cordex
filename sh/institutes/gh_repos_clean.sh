#!/usr/bin/env bash

# Main entry point.
function _main()
{
    local INSTITUTION
    local PATH_TO_REPO

	for INSTITUTION in "${CORDEX_INSTITUTION_ID[@]}"
	do
        PATH_TO_REPO="$CORDEX_HOME/repos/institutions/$INSTITUTION"
        if [ -d "$PATH_TO_REPO" ]; then
            _do "$INSTITUTION" "$PATH_TO_REPO"
        fi
	done
}

function _do() {
    local INSTITUTION=${1}
    local PATH_TO_REPO=${2}

    # rm -rf "$PATH_TO_REPO/cordexp/citations"
    # rm -rf "$PATH_TO_REPO/cordexp/parties"
    # echo "TODO : clean repo :: "$PATH_TO_REPO/cordex""
}

# Invoke entry point.
_main
