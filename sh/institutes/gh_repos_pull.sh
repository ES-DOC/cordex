#!/usr/bin/env bash

# Main entry point.
function main()
{
	local INSTITUTION

	for INSTITUTION in "${CORDEX_INSTITUTE[@]}"
	do
        if [ -d "$CORDEX_HOME/repos/institutions/$INSTITUTION" ]; then
			log "GH : pulling $INSTITUTION"
			pushd "$CORDEX_HOME/repos/institutions/$INSTITUTION" || exit
            git pull
			popd || exit
        fi
	done
}

# Invoke entry point.
main
