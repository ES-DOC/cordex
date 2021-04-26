#!/usr/bin/env bash

# Main entry point.
function main()
{
	local INSTITUTION

	for INSTITUTION in "${CORDEXP_INSTITUTION_ID[@]}"
	do
        if [ -d "$CORDEX_HOME/repos/institutions/$INSTITUTION" ]; then
			pushd "$CORDEX_HOME/repos/institutions/$INSTITUTION" || exit
			log "GH : adding files to $INSTITUTION"
			git add "*"
			popd || exit
        fi
	done
}

# Invoke entry point.
main
