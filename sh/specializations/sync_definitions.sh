#!/usr/bin/env bash

#######################################
# Syncs specializations tooling from toplevel.
# Globals:
#   CORDEX_HOME - path to cordex hsell home directory.
# Arguments:
#   Specialization repo name.
#######################################
function _do_sync_definitions()
{
	local specialization=${1}
	local path_to_repo=$CORDEX_HOME/repos/specializations/cordex-specializations-$specialization

	log "syncing py files ..."
	cp $path_to_repo/$specialization*.py \
	   $CORDEX_HOME/repos/libs/esdoc-py-client/pyesdoc/mp/specializations/cordex

	log "synced tooling: "$specialization
}


#######################################
# Main entry point.
# Globals:
#   CORDEX_SPECIALIZATIONS - array of specializations.
#######################################
function main()
{
	rm $CORDEX_HOME/repos/libs/esdoc-py-client/pyesdoc/mp/specializations/cordex/*.py
	for specialization in "${CORDEX_SPECIALIZATIONS[@]}"
	do
		_do_sync_definitions $specialization
	done
}

# Invoke entry point.
main
