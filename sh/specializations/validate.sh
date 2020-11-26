#!/bin/bash

#######################################
# Validates specialisation definitions.
# Globals:
#   CORDEXP_PATH_REPOS - path to managed repos.
# Arguments:
#   Specialization repo name.
#######################################function _do_validate()
{
	local repo=${1}
	local path_to_repo=$CORDEXP_PATH_REPOS/${repo}

	pipenv run python $path_to_repo/validate
}

#######################################
# Main entry point.
# Globals:
#   CORDEXP_SPECIALIZATIONS - array of specializations.
#######################################
main()
{
	for specialization in "${CORDEXP_SPECIALIZATIONS[@]}"
	do
		_do_validate cordexp-specializations-$specialization
	done
}

# Import utils.
source $CORDEXP_PATH_SH/utils.sh

# Invoke entry point.
main
