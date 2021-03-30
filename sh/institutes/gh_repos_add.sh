#!/usr/bin/env bash

# Main entry point.
function main()
{
	for institute in "${INSTITUTE[@]}"
	do
        if [ -d "$CORDEX_HOME"/repos/institutions/$institute ]; then
			pushd "$CORDEX_HOME"/repos/institutions/$institute
			log "GH : adding files to  "$institute
			git add *
			popd 1
        fi
	done
}

# Import utils.
source $"$CORDEX_HOME"/sh/utils.sh

# Invoke entry point.
main
