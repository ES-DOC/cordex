#!/usr/bin/env bash

# Main entry point.
function _main()
{
	local INSTITUTION

	for INSTITUTION in "${CORDEXP_INSTITUTION_ID[@]}"
	do
        if [ -d "$CORDEX_HOME/repos/institutions/$INSTITUTION" ]; then
			pushd "$CORDEX_HOME/repos/institutions/$INSTITUTION" || exit
			log "GH : resetting $INSTITUTION"
			git reset HEAD
			popd || exit
        fi
	done
}

# Invoke entry point.
_main
