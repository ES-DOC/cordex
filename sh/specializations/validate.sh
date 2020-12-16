#!/bin/bash

#######################################
# Validates specialisation definitions.
# Globals:
#   CORDEX_PATH_REPOS - path to managed repos.
# Arguments:
#   Specialization repo name.
#######################################function _do_validate()
{
	local repo=${1}
	local path_to_repo=$CORDEX_PATH_REPOS/${repo}

	pipenv run python $path_to_repo/validate
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
		_do_validate cordex-specializations-$specialization
	done
}

# Import utils.
source $CORDEX_PATH_SH/utils.sh

# Invoke entry point.
main
