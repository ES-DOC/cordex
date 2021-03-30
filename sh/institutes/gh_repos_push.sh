#!/usr/bin/env bash

# Main entry point.
function main()
{
	for institute in "${INSTITUTE[@]}"
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

# Import utils.
source $"$CORDEX_HOME"/sh/utils.sh

# Invoke entry point.
main $1
