#!/usr/bin/env bash

#######################################
# Pushes latest specialization changes to a remote.
# Globals:
#   CORDEX_HOME - path to cordex shell home directory.
#   CORDEX_SPECIALIZATIONS - array of specializations.
#######################################
function main()
{
	local comment=${1}

	for specialization in "${CORDEX_SPECIALIZATIONS[@]}"
	do
		_do_push "$CORDEX_HOME/repos/specializations" "$specialization" "$comment"
	done
	_do_push "$CORDEX_HOME/repos/libs esdoc-web-view-specialization" "$comment"
	_do_push "$CORDEX_HOME/repos/libs esdoc-py-client" "$comment"
}

function _do_push()
{
	local PATH_TO_FOLDER=${1}
	local REPO_NAME=${2}
	local MSG=${3}
	local PATH_TO_REPO

	PATH_TO_REPO="$PATH_TO_FOLDER/$REPO_NAME"

	if [ -d "$PATH_TO_REPO" ]; then
		pushd "$PATH_TO_REPO"
		if [ ! -z "$(git status --porcelain)" ]; then
			log "pushing -> "$repo
			git add *
			git add ./.gitignore
			git commit -m $MSG
			git push > /dev/null
		else
			log "nothing to push -> "$repo
		fi
		popd 1
	fi
}

# Invoke entry point.
main $1
