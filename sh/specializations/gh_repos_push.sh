#!/bin/bash

#######################################
# Pushes latest changes to a remote.
# Globals:
#   CORDEXP_PATH_REPOS - path to managed repos.
# Arguments:
#   Path to local repo to be pulled.
#######################################
function _do_push()
{
	local repo=${1}
	local path_to_repo=$CORDEXP_PATH_REPOS/$repo
	local comment=${2}

	if [ -d $path_to_repo ]; then
		pushd $path_to_repo
		if [ ! -z "$(git status --porcelain)" ]; then
			log "pushing -> "$repo
			git add *
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
#   CORDEXP_SPECIALIZATIONS - array of specializations.
#######################################
main()
{
	local comment=${1}

	for specialization in "${CORDEXP_SPECIALIZATIONS[@]}"
	do
		_do_push cordexp-specializations-$specialization $comment
	done
	_do_push esdoc-web-view-specialization $comment
}

# Import utils.
source $CORDEXP_BASH/utils.sh

# Invoke entry point.
main $1