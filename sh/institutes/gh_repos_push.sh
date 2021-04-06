#!/usr/bin/env bash

# Main entry point.
function main()
{
	for institute in "${CORDEX_INSTITUTE[@]}"
	do
        if [ -d "$CORDEX_HOME"/repos/institutions/$institute ]; then
			pushd "$CORDEX_HOME"/repos/institutions/$institute
			log "GH : pushing  "$institute
			git add *
			git add ./.gitignore
			git commit -S -a -m $1
			git push
			popd 1
        fi
	done
}

# Invoke entry point.
main $1
