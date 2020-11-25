#!/bin/bash

# Main entry point.
main()
{
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
