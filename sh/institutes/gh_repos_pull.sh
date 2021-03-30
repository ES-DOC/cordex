#!/usr/bin/env bash

# Main entry point.
function main()
{
	for institute in "${INSTITUTE[@]}"
	do
        if [ -d "$CORDEX_HOME"/repos/institutions/$institute ]; then
			pushd "$CORDEX_HOME"/repos/institutions/$institute
			log "GH : pulling  "$institute
			git pull
			popd 1
        fi
	done
}

# Invoke entry point.
main
