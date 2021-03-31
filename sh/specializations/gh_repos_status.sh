#!/usr/bin/env bash

#######################################
# Renders local repo status.
# Arguments:
#   Repo name.
#######################################
function _do_render_status()
{
	local PATH_TO_FOLDER=${1}
	local REPO_NAME=${2}

	local PATH_TO_REPO="$PATH_TO_FOLDER"/"$REPO_NAME"

	if [ -d "$PATH_TO_REPO" ]; then
		log_banner
		log "status : $REPO_NAME"
		log_banner

		pushd "$PATH_TO_REPO"
		git status 
		popd
	fi
}

#######################################
# Main entry point.
# Globals:
#   CORDEX_SPECIALIZATIONS - array of specializations.
#######################################
function main()
{
	for specialization in "${CORDEX_SPECIALIZATIONS[@]}"
	do
		_do_render_status $CORDEX_HOME/repos/specializations "$specialization"
	done
	_do_render_status $CORDEX_HOME/repos/specializations esdoc-web-view-specialization
	_do_render_status $CORDEX_HOME/repos/libs esdoc-py-client
}

# Invoke entry point.
main
