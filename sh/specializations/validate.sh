#!/bin/bash

function _do_validate()
{
	local repo=${1}
	local path_to_repo=$CORDEXP_PATH_REPOS/${repo}

	python $path_to_repo/validate
}

# Main entry point.
main()
{
	for specialization in "${CORDEXP_SPECIALIZATIONS[@]}"
	do
		_do_validate cordexp-specializations-$specialization
	done
}

# Import utils.
source $CORDEXP_BASH/utils.sh

# Invoke entry point.
main
