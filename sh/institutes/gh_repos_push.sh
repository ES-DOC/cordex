#!/bin/bash

# Main entry point.
main()
{
	for institute in "${INSTITUTE[@]}"
	do
        if [ -d $ESDOC_INSTITUTIONAL_HOME/$institute ]; then
			pushd $ESDOC_INSTITUTIONAL_HOME/$institute
			log "GH : pushing  "$institute
			git add *
			git commit -S -a -m $1
			git push origin master
			popd -1
        fi
	done
}

# Invoke entry point.
main $1
