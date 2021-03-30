#!/usr/bin/env bash

# Main entry point.
function main()
{
	for institute in "${INSTITUTE[@]}"
	do
        if [ -d "$CORDEX_HOME"/repos/institutions/$institute ]; then
			pushd "$CORDEX_HOME"/repos/institutions/$institute
			log "GH : resetting  "$institute
			git reset HEAD
			popd 1
        fi
	done
}

# Invoke entry point.
main
