#!/usr/bin/env bash

# Main entry point.
function main()
{
	for institution_id in "${CORDEX_INSTITUTE[@]}"
	do
        if [ -d "$CORDEX_HOME"/repos/institutions/$institute ]; then
			log "GH : status of "$institution_id
			pushd "$CORDEX_HOME"/repos/institutions/$institution_id
			git status
			popd 1
		else
			log "Institutional repo not found: ""$CORDEX_HOME"/repos/institutions/$institute
        fi
	done
}

# Invoke entry point.
main
