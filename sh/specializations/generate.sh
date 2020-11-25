#!/bin/bash

function _do_generate()
{
	local repo=${1}
	local path_to_repo=$CORDEXP_PATH_REPOS/${repo}

	log "generating "$repo
	python $path_to_repo/generate
}

# Main entry point.
main()
{
	for specialization in "${CORDEXP_SPECIALIZATIONS[@]}"
	do
		_do_generate cordexp-specializations-$specialization
	done
}

# Import utils.
source $CORDEXP_BASH/utils.sh

# Invoke entry point.
main
