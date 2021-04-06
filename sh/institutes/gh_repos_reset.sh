#!/usr/bin/env bash

# Main entry point.
function main()
{
	local INSTITUTION

	for INSTITUTION in "${CORDEX_INSTITUTE[@]}"
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
main
