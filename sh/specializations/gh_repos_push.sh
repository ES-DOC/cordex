#!/usr/bin/env bash

#######################################
# Pushes latest specialization changes to a remote.
# Globals:
#   CORDEX_HOME - path to cordex shell home directory.
#   CORDEXP_SPECIALIZATIONS - array of specializations.
# Arguments:
#   Commit message.
#######################################
function _main()
{
	local MSG=${1}
	local SPECIALIZATION

	for SPECIALIZATION in "${CORDEXP_SPECIALIZATIONS[@]}"
	do
		_do "$CORDEX_HOME/repos/specializations" "$SPECIALIZATION" "$MSG"
	done
	_do "$CORDEX_HOME/repos/libs" "esdoc-web-view-specialization" "$MSG"
	_do "$CORDEX_HOME/repos/libs" "esdoc-py-client" "$MSG"
}

function _do()
{
	local PATH_TO_FOLDER=${1}
	local REPO_NAME=${2}
	local MSG=${3}
	local PATH_TO_REPO

	PATH_TO_REPO="$PATH_TO_FOLDER/$REPO_NAME"

	if [ -d "$PATH_TO_REPO" ]; then
		pushd "$PATH_TO_REPO" || exit
		if [ -n "$(git status --porcelain)" ]; then
			log "pushing -> $REPO_NAME"
			git add "*"
			git add ./.gitignore
			git commit -m "$MSG"
			git push > /dev/null
		else
			log "nothing to push -> $REPO_NAME"
		fi
		popd || exit
	fi
}

# Invoke entry point.
_main "$1"
