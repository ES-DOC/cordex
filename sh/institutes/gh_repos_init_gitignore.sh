#!/usr/bin/env bash

# Main entry point.
function _main()
{
	local INSTITUTION

	for INSTITUTION in "${CORDEXP_INSTITUTION_ID[@]}"
	do
        if [ -d "$CORDEX_HOME/repos/institutions/$INSTITUTION" ]; then
			log "GH : initialising .gitignore of $INSTITUTION"
			pushd "$CORDEX_HOME/repos/institutions/$INSTITUTION" || exit
            cp $"$CORDEX_HOME/templates/repo_gitignore" ./.gitignore
            git init > /dev/null
			popd || exit
        fi
	done
}

# Invoke entry point.
_main
