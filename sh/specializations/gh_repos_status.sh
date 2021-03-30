#!/usr/bin/env bash

#######################################
# Renders local repo status.
# Globals:
#   CORDEX_PATH_REPOS_SPEC - path to managed specialization repos.
# Arguments:
#   Repo name.
#######################################
function _do_render_status()
{
	local folder=${1}
	local repo=${2}
	local path_to_repo=$folder/$repo

	if [ -d $path_to_repo ]; then
		log_banner
		log "status : "$repo
		log_banner
		pushd $path_to_repo
		git status 
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
	for specialization in "${CORDEX_SPECIALIZATIONS[@]}"
	do
		_do_render_status $CORDEX_PATH_REPOS_SPEC cordex-specializations-$specialization
	done
	_do_render_status $CORDEX_PATH_REPOS_SPEC esdoc-web-view-specialization
	_do_render_status $CORDEX_HOME/repos/libs esdoc-py-client
}

# Import utils.
source $"$CORDEX_HOME"/sh/utils.sh

# Invoke entry point.
main
