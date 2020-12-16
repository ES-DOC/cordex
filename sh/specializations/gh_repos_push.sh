#!/bin/bash

#######################################
# Pushes latest changes to a remote.
# Globals:
#   CORDEX_PATH_REPOS - path to managed repos.
# Arguments:
#   Specialization repo name.
#######################################
function _do_push()
{
	local repo=${1}
	local path_to_repo=$CORDEX_PATH_REPOS/$repo
	local comment=${2}

	if [ -d $path_to_repo ]; then
		pushd $path_to_repo
		if [ ! -z "$(git status --porcelain)" ]; then
			log "pushing -> "$repo
			git add *
			git add ./.gitignore
			git commit -m $comment
			git push > /dev/null
		else
			log "nothing to push -> "$repo
		fi
		popd -1
	fi
}

#######################################
# Main entry point.
# Globals:
#   CORDEX_SPECIALIZATIONS - array of specializations.
#######################################
main()
{
	local comment=${1}

	for specialization in "${CORDEX_SPECIALIZATIONS[@]}"
	do
		_do_push cordex-specializations-$specialization $comment
	done
	_do_push esdoc-web-view-specialization $comment
	_do_push esdoc-py-client $comment
}

# Import utils.
source $CORDEX_PATH_SH/utils.sh

# Invoke entry point.
main $1
