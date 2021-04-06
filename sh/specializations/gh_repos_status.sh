#!/usr/bin/env bash

#######################################
# Emits to stdout change status of managed repos.
# Globals:
#   CORDEX_HOME - path to cordex shell home directory.
#   CORDEX_SPECIALIZATIONS - array of specializations.
#######################################
function main()
{
	local SPECIALIZATION

	for SPECIALIZATION in "${CORDEX_SPECIALIZATIONS[@]}"
	do
		_do "$CORDEX_HOME/repos/specializations" "$SPECIALIZATION"
	done
	_do "$CORDEX_HOME/repos/libs" esdoc-web-view-specialization
	_do "$CORDEX_HOME/repos/libs" esdoc-py-client
}

function _do()
{
	local PATH_TO_FOLDER=${1}
	local REPO_NAME=${2}
	local PATH_TO_REPO

	PATH_TO_REPO="$PATH_TO_FOLDER/$REPO_NAME"

	if [ -d "$PATH_TO_REPO" ]; then
		log_banner
		log "status : $REPO_NAME"
		log_banner

		pushd "$PATH_TO_REPO" || exit
		git status 
		popd || exit
	fi
}

# Invoke entry point.
main
