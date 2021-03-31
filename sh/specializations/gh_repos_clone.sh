#!/usr/bin/env bash

#######################################
# Pulls latest changes from a remote.
# Globals:
#   CORDEX_HOME - path to cordex root folder.
# Arguments:
#   Specialization repo name.
#######################################
function _do_clone()
{
	local folder=${1}
	local repo=${2}
	local path_to_repo=$folder/$repo

	if [ ! -d $path_to_repo ]; then
		log "cloning "$path_to_repo
		pushd $folder
		git clone https://github.com/ES-DOC/$repo.git
		popd 1
	else
		log "already cloned -> "$repo
	fi
}

#######################################
# Main entry point.
# Globals:
#   CORDEX_SPECIALIZATIONS - array of specializations.
#######################################
function main()
{
	if [ ! -d "$CORDEX_HOME/repos/specializations" ]; then
		mkdir -p "$CORDEX_HOME/repos/specializations"
	fi
	if [ ! -d "$CORDEX_HOME/repos/libs" ]; then
		mkdir -p "$CORDEX_HOME/repos/libs"
	fi

	for specialization in "${CORDEX_SPECIALIZATIONS[@]}"
	do
		_do_clone "$CORDEX_HOME/repos/specializations" "$specialization"
	done
	_do_clone $CORDEX_HOME/repos/libs esdoc-web-view-specialization
	_do_clone $CORDEX_HOME/repos/libs esdoc-py-client
}

# Invoke entry point.
main
