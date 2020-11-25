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
	local path_to_toplevel_repo=$CORDEXP_PATH_REPOS/cordexp-specializations-toplevel

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

	# All toplevel specialisations:
	# ... sync with viewer
	cp -r $path_to_repo/_$specialization.js \
		  $CORDEXP_PATH_REPOS/esdoc-web-view-specialization/data/cordexp_$specialization.js	

	log "synced tooling: "$specialization
}


#######################################
# Main entry point.
# Globals:
#   CORDEXP_SPECIALIZATIONS - array of specializations.
#######################################
main()
{
	rm $ESDOC_DIR_REPOS_CORE/esdoc-py-client/pyesdoc/mp/specializations/cordexp/*.py

	log "syncing py files ..."
	rm $ESDOC_DIR_REPOS_CORE/esdoc-py-client/pyesdoc/mp/specializations/cordexp/*.py
	for specialization in "${CORDEXP_SPECIALIZATIONS[@]}"
	do
		cp $CORDEXP_ROOT/cordexp-specializations-$specialization/$specialization*.py $ESDOC_DIR_REPOS_CORE/esdoc-py-client/pyesdoc/mp/specializations/cordexp
	done

	log "syncing json files ..."
	for specialization in "${CORDEXP_SPECIALIZATIONS[@]}"
	do
		rm $ESDOC_DIR_REPOS_CORE/esdoc-docs/cordexp/models/config/$specialization.json
		cp $CORDEXP_ROOT/cordexp-specializations-$specialization/_$specialization.json $ESDOC_DIR_REPOS_CORE/esdoc-docs/cordexp/models/config/$specialization.json
	done

	log "syncing mindmap files ..."
	for specialization in "${CORDEXP_SPECIALIZATIONS[@]}"
	do
		rm $ESDOC_DIR_REPOS_CORE/esdoc-docs/cordexp/models/mindmaps/$specialization.mm
		cp $CORDEXP_ROOT/cordexp-specializations-$specialization/_$specialization.mm $ESDOC_DIR_REPOS_CORE/esdoc-docs/cordexp/models/mindmaps/$specialization.mm
	done
}

# Import utils.
source $CORDEXP_BASH/utils.sh

# Invoke entry point.
main
