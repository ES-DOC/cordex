#!/bin/bash

# Main entry point.
main()
{
	for institute in "${INSTITUTE[@]}"
	do
        if [ -d $ESDOC_INSTITUTIONAL_HOME/$institute ]; then
			pushd $ESDOC_INSTITUTIONAL_HOME/$institute
			log "GH : resetting  "$institute
			git reset HEAD
			popd -1
        fi
	done
}

# Import utils.
source $CORDEXP_PATH_SH/utils.sh

# Invoke entry point.
main
