#!/bin/bash

#######################################
# Pulls latest changes from a remote.
# Globals:
#   CORDEXP_PATH_REPOS - path to managed repos.
# Arguments:
#   Path to local repo to be pulled.
#######################################
function _do_pull()
{
	local repo=${1}
	local path_to_repo=$CORDEXP_PATH_REPOS/${repo}

	if [ -d $path_to_repo ]; then
		log "pulling "$repo
		pushd $path_to_repo
		git pull > /dev/null
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
		_do_pull cordexp-specializations-$specialization
	done
	_do_pull esdoc-web-view-specialization
}

# Import utils.
source $CORDEXP_BASH/utils.sh

# Invoke entry point.
main