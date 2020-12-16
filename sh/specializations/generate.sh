#!/bin/bash

#######################################
# Generates various specialisation assets definitions.
# Globals:
#   CORDEX_PATH_REPOS - path to managed repos.
# Arguments:
#   Specialization repo name.
#######################################
function _do_generate()
{
	local repo=${1}
	local path_to_repo=$CORDEX_PATH_REPOS/${repo}

	log "generating "$repo
	pipenv run python $path_to_repo/generate
}

#######################################
# Main entry point.
# Globals:
#   CORDEX_SPECIALIZATIONS - array of specializations.
#######################################
main()
{
	for specialization in "${CORDEX_SPECIALIZATIONS[@]}"
	do
		_do_generate cordex-specializations-$specialization
	done
}

# Import utils.
source $CORDEX_PATH_SH/utils.sh

# Invoke entry point.
main
