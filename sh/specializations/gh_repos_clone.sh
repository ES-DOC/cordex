#!/bin/bash

#######################################
# Pulls latest changes from a remote.
# Globals:
#   CORDEXP_PATH_REPOS - path to managed repos.
# Arguments:
#   Specialization repo name.
#######################################
function _do_clone()
{
	local repo=${1}
	local path_to_repo=$CORDEXP_PATH_REPOS/$repo

	if [ ! -d $path_to_repo ]; then
		log "cloning "$path_to_repo
		pushd $CORDEXP_PATH_REPOS
		git clone https://github.com/ES-DOC/$repo.git
		popd -1
	else
		log "already cloned -> "$repo
	fi
}

#######################################
# Main entry point.
# Globals:
#   CORDEXP_SPECIALIZATIONS - array of specializations.
#######################################
main()
{
	if [ ! -d $CORDEXP_PATH_REPOS ]; then
		mkdir -p $CORDEXP_PATH_REPOS
	fi

	for specialization in "${CORDEXP_SPECIALIZATIONS[@]}"
	do
		_do_clone cordexp-specializations-$specialization
	done
	_do_clone esdoc-web-view-specialization
	_do_clone esdoc-py-client
}

# Import utils.
source $CORDEXP_BASH/utils.sh

# Invoke entry point.
main
