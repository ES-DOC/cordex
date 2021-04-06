#!/usr/bin/env bash

#######################################
# Pulls latest changes from a remote.
# Globals:
#   CORDEX_HOME - path to cordex shall root folder.
#   CORDEX_SPECIALIZATIONS - array of specializations.
#######################################
function main()
{
	for SPECIALIZATION in "${CORDEX_SPECIALIZATIONS[@]}"
	do
		_do "$CORDEX_HOME/repos/specializations" "$SPECIALIZATION"
	done
	_do "$CORDEX_HOME/repos/libs" "esdoc-web-view-specialization"
	_do "$CORDEX_HOME/repos/libs" "esdoc-py-client"
}

function _do()
{
	local REPO_FOLDER=${1}
	local REPO_NAME=${2}
	local PATH_TO_REPO
	
	PATH_TO_REPO=$REPO_FOLDER/${REPO_NAME}

	if [ -d "$PATH_TO_REPO" ]; then
		log "pulling $REPO_NAME"
		pushd "$PATH_TO_REPO" || exit
		git pull > /dev/null
		popd || exit
	fi
}

# Invoke entry point.
main
