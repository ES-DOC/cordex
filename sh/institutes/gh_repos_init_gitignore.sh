#!/bin/bash

# Main entry point.
main()
{
	for institution_id in "${INSTITUTE[@]}"
	do
        if [ -d $ESDOC_INSTITUTIONAL_HOME/$institute ]; then
			log "GH : initialising .gitignore of "$institution_id
			pushd $ESDOC_INSTITUTIONAL_HOME/$institution_id
            cp $CORDEXP_PATH_TEMPLATES/repo_gitignore ./.gitignore
            git init > /dev/null
			popd -1
        fi
	done
}

# Import utils.
source $CORDEXP_PATH_SH/utils.sh

# Invoke entry point.
main
