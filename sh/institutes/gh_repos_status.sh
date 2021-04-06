#!/usr/bin/env bash

# Main entry point.
function main()
{
	local INSTITUTION

	for INSTITUTION in "${CORDEX_INSTITUTE[@]}"
	do
        if [ -d "$CORDEX_HOME/repos/institutions/$INSTITUTION" ]; then
			pushd "$CORDEX_HOME/repos/institutions/$INSTITUTION" || exit
			log "GH : status of $INSTITUTION"
			git status
			popd || exit
		else
			log "Institutional repo not found: $CORDEX_HOME/repos/institutions/$INSTITUTION"
        fi
	done
}

# Invoke entry point.
main
