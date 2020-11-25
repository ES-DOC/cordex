#!/bin/bash

# Main entry point.
main()
{
	for institute in "${INSTITUTE[@]}"
	do
        if [ -d $ESDOC_INSTITUTIONAL_HOME/$institute ]; then
			pushd $ESDOC_INSTITUTIONAL_HOME/$institute
			log "GH : adding files to  "$institute
			git add *
			popd -1
        fi
	done
}

# Import utils.
source $CORDEXP_BASH/utils.sh

# Invoke entry point.
main
