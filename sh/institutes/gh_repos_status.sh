#!/bin/bash

# Main entry point.
main()
{
	for institution_id in "${INSTITUTE[@]}"
	do
        if [ -d $ESDOC_INSTITUTIONAL_HOME/$institute ]; then
			log "GH : status of "$institution_id
			pushd $ESDOC_INSTITUTIONAL_HOME/$institution_id
			git status
			popd -1
        fi
	done
}

# Import utils.
source $CORDEXP_BASH/utils.sh

# Invoke entry point.
main
