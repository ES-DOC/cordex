#!/bin/bash

#######################################
# Syncs specializations tooling from toplevel.
# Globals:
#   CORDEX_PATH_REPOS - path to managed repos.
# Arguments:
#   Specialization repo name.
#######################################
function _do_sync_definitions()
{
	local specialization=${1}
	local path_to_repo=$CORDEX_PATH_REPOS/cordex-specializations-$specialization

	log "syncing py files ..."
	cp $path_to_repo/$specialization*.py \
	   $CORDEX_PATH_REPOS/esdoc-py-client/pyesdoc/mp/specializations/cordex

	log "synced tooling: "$specialization
}


#######################################
# Main entry point.
# Globals:
#   CORDEX_SPECIALIZATIONS - array of specializations.
#######################################
main()
{
	rm $CORDEX_PATH_REPOS/esdoc-py-client/pyesdoc/mp/specializations/cordex/*.py
	for specialization in "${CORDEX_SPECIALIZATIONS[@]}"
	do
		_do_sync_definitions $specialization
	done
}

# Import utils.
source $CORDEX_PATH_SH/utils.sh

# Invoke entry point.
main
