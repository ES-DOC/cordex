#!/bin/bash

#######################################
# Syncs specializations tooling from toplevel.
# Globals:
#   CORDEX_PATH_REPOS - path to managed repos.
# Arguments:
#   Specialization repo name.
#######################################
function _do_sync_tooling()
{
	local specialization=${1}
	local path_to_repo=$CORDEX_PATH_REPOS/cordex-specializations-$specialization
	local path_to_toplevel_repo=$CORDEX_PATH_REPOS/cordex-specializations-toplevel

	# Non toplevel specialisations.
	if [ $specialization != "toplevel" ]; then
		# ... sync generator
		rm -rf $path_to_repo/generate
		mkdir $path_to_repo/generate
		cp -r $path_to_toplevel_repo/generate/* $path_to_repo/generate
	
		# ... sync validator
		rm -rf $path_to_repo/validate
		mkdir $path_to_repo/validate
		cp -r $path_to_toplevel_repo/validate/* $path_to_repo/validate

		# ... sync templates
		rm -rf $path_to_repo/templates
		mkdir $path_to_repo/templates
		cp -r $path_to_toplevel_repo/templates/* $path_to_repo/templates
	fi

	# All specialisations:
	# ... sync with pyesdoc
	cp $path_to_repo/$specialization*.py \
	   $CORDEX_PATH_REPOS/esdoc-py-client/pyesdoc/mp/specializations/cordex
	# ... sync with viewer
	cp -r $path_to_repo/_$specialization.js \
		  $CORDEX_PATH_REPOS/esdoc-web-view-specialization/data/cordex_$specialization.js	

	log "synced tooling: "$specialization
}

#######################################
# Main entry point.
# Globals:
#   CORDEX_SPECIALIZATIONS - array of specializations.
#######################################
main()
{

	local path_to_pyesdoc_mp=$CORDEX_PATH_REPOS/esdoc-py-client/pyesdoc/mp/specializations/cordex
	if [ -d $path_to_pyesdoc_mp ]; then
		rm -rf $path_to_pyesdoc_mp
	fi
	mkdir $path_to_pyesdoc_mp

	for specialization in "${CORDEX_SPECIALIZATIONS[@]}"
	do
		_do_sync_tooling $specialization
	done
}

# Import utils.
source $CORDEX_PATH_SH/utils.sh

# Invoke entry point.
main
