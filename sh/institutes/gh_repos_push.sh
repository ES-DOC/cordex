#!/bin/bash

# Main entry point.
main()
{
	for institute in "${INSTITUTE[@]}"
	do
        if [ -d $CORDEX_PATH_REPOS_INST/$institute ]; then
			pushd $CORDEX_PATH_REPOS_INST/$institute
			log "GH : pushing  "$institute
			git add *
			git add ./.gitignore
			git commit -S -a -m $1
			git push
			popd -1
        fi
	done
}

# Import utils.
source $CORDEX_PATH_SH/utils.sh

# Invoke entry point.
main $1
