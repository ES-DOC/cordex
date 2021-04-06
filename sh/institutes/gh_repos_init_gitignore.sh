#!/usr/bin/env bash

# Main entry point.
function main()
{
	for institution_id in "${CORDEX_INSTITUTE[@]}"
	do
        if [ -d "$CORDEX_HOME"/repos/institutions/$institute ]; then
			log "GH : initialising .gitignore of "$institution_id
			pushd "$CORDEX_HOME"/repos/institutions/$institution_id
            cp $"$CORDEX_HOME"/templates/repo_gitignore ./.gitignore
            git init > /dev/null
			popd 1
        fi
	done
}

# Invoke entry point.
main
