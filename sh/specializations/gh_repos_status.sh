#!/bin/bash

#######################################
# Renders local repo status.
# Globals:
#   CORDEXP_PATH_REPOS - path to managed repos.
# Arguments:
#   Repo name.
#######################################
function _do_render_status()
{
	local repo=${1}
	local path_to_repo=$CORDEXP_PATH_REPOS/$repo

	if [ -d $path_to_repo ]; then
		log_banner
		log "status : "$repo
		log_banner
		pushd $path_to_repo
		git status 
		popd -1
	fi
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
		_do_render_status cordexp-specializations-$specialization
	done
	_do_render_status esdoc-web-view-specialization
	_do_render_status esdoc-py-client
}

# Import utils.
source $CORDEXP_BASH/utils.sh

# Invoke entry point.
main
