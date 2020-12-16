#!/bin/bash

# Main entry point.
main()
{
	log 666
	for institution_id in "${INSTITUTE[@]}"
	do
        if [ -d $CORDEX_PATH_REPOS_INST/$institute ]; then
			log "GH : status of "$institution_id
			pushd $CORDEX_PATH_REPOS_INST/$institution_id
			git status
			popd -1
        fi
	done
}

# Import utils.
source $CORDEX_PATH_SH/utils.sh

# Invoke entry point.
main
