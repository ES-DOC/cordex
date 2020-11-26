#!/bin/bash

#######################################
# Syncs specializations tooling from toplevel.
# Globals:
#   CORDEXP_PATH_REPOS - path to managed repos.
# Arguments:
#   Specialization repo name.
#######################################
function _do_sync_definitions()
{
	local specialization=${1}
	local path_to_repo=$CORDEXP_PATH_REPOS/cordexp-specializations-$specialization

	log "syncing py files ..."
	cp $path_to_repo/$specialization*.py \
	   $CORDEXP_PATH_REPOS/esdoc-py-client/pyesdoc/mp/specializations/cordexp

	log "synced tooling: "$specialization
}


#######################################
# Main entry point.
# Globals:
#   CORDEXP_SPECIALIZATIONS - array of specializations.
#######################################
main()
{
	rm $CORDEXP_PATH_REPOS/esdoc-py-client/pyesdoc/mp/specializations/cordexp/*.py
	for specialization in "${CORDEXP_SPECIALIZATIONS[@]}"
	do
		_do_sync_definitions $specialization
	done
}

# Import utils.
source $CORDEXP_PATH_SH/utils.sh

# Invoke entry point.
main
