#!/bin/bash

# Main entry point.
main()
{
	for institution_id in "${INSTITUTE[@]}"
	do
        if [ -d $CORDEX_PATH_REPOS_INST/$institute ]; then
			log "GH : initialising .gitignore of "$institution_id
			pushd $CORDEX_PATH_REPOS_INST/$institution_id
            cp $CORDEX_PATH_TEMPLATES/repo_gitignore ./.gitignore
            git init > /dev/null
			popd -1
        fi
	done
}

# Import utils.
source $CORDEX_PATH_SH/utils.sh

# Invoke entry point.
main
