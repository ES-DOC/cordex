#!/usr/bin/env bash

#######################################
# Pushes latest changes to a remote.
# Globals:
#   CORDEX_PATH_REPOS_SPEC - path to managed specialization repos.
# Arguments:
#   Specialization repo name.
#######################################
function _do_push()
{
	local folder=${1}
	local repo=${2}
	local path_to_repo=$folder/$repo
	local comment=${3}

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
		popd 1
	fi
}

#######################################
# Main entry point.
# Globals:
#   CORDEX_SPECIALIZATIONS - array of specializations.
#######################################
function main()
{
	local comment=${1}

	for specialization in "${CORDEX_SPECIALIZATIONS[@]}"
	do
		_do_push $CORDEX_PATH_REPOS_SPEC cordex-specializations-$specialization $comment
	done
	_do_push $CORDEX_HOME/repos/libs esdoc-web-view-specialization $comment
	_do_push $CORDEX_HOME/repos/libs esdoc-py-client $comment
}

# Import utils.
source $"$CORDEX_HOME"/sh/utils.sh

# Invoke entry point.
main $1
