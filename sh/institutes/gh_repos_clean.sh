#!/usr/bin/env bash

# Main entry point.
function main()
{
    local INSTITUTION

	for INSTITUTION in "${CORDEXP_INSTITUTION_ID[@]}"
	do
        if [ -d "$CORDEX_HOME/repos/institutions/$INSTITUTION" ]; then
            do_clean "$INSTITUTION"
        fi
	done
}

function do_clean() {
    local INSTITUTION=${1}

    pushd "$CORDEX_HOME/repos/institutions/$INSTITUTION" || exit
    echo "$CORDEX_HOME/repos/institutions/$INSTITUTION/cordex/models"
    popd || exit

}

# Invoke entry point.
main
