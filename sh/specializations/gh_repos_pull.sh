#!/usr/bin/env bash

#######################################
# Pulls latest changes from a remote.
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
	for SPECIALIZATION in "${CORDEX_SPECIALIZATIONS[@]}"
	do
		_do_pull "$CORDEX_HOME/repos/specializations" "cordex-specializations-$SPECIALIZATION"
	done
	_do_pull "$CORDEX_HOME/repos/libs esdoc-web-view-specialization"
	_do_pull "$CORDEX_HOME/repos/libs esdoc-py-client"
}

# Invoke entry point.
main
