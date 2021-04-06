#!/usr/bin/env bash

# Main entry point.
function main()
{
	for institute in "${CORDEX_INSTITUTE[@]}"
	do
        if [ -d "$CORDEX_HOME"/repos/institutions/$institute ]; then
			pushd "$CORDEX_HOME"/repos/institutions/$institute
			log "GH : adding files to  "$institute
			git add *
			popd 1
        fi
	done
}

# Invoke entry point.
main
