#!/usr/bin/env bash

# Main entry point.
function main()
{
	local MSG=${1}
	local INSTITUTION

	for INSTITUTION in "${CORDEX_INSTITUTION_ID[@]}"
	do
        if [ -d "$CORDEX_HOME/repos/institutions/$INSTITUTION" ]; then
			log "GH : pushing $INSTITUTION"
			pushd "$CORDEX_HOME/repos/institutions/$INSTITUTION" || exit
			git add "*"
			git add ./.gitignore
			git commit -S -a -m "$MSG"
			git push
			popd || exit
        fi
	done
}

# Invoke entry point.
main "$1"
