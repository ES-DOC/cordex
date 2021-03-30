#!/usr/bin/env bash

#######################################
# Pulls latest changes from a remote.
# Globals:
#   CORDEX_PATH_REPOS_SPEC - path to managed specialization repos.
# Arguments:
#   Specialization repo name.
#######################################
function _do_pull()
{
	local folder=${1}
	local repo=${1}
	local path_to_repo=$folder/${repo}

	if [ -d $path_to_repo ]; then
		log "pulling "$repo
		pushd $path_to_repo
		git pull > /dev/null
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
		_do_pull $CORDEX_PATH_REPOS_SPEC cordex-specializations-$specialization
	done
	_do_pull $CORDEX_HOME/repos/libs esdoc-web-view-specialization
	_do_pull $CORDEX_HOME/repos/libs esdoc-py-client
}

# Import utils.
source $"$CORDEX_HOME"/sh/utils.sh

# Invoke entry point.
main
