#!/usr/bin/env bash

#######################################
# Syncs specializations tooling from toplevel.
# Globals:
#   CORDEX_HOME - path to cordex shell home directory.
#   CORDEXP_SPECIALIZATIONS - array of specializations.
# Arguments:
#   Specialization repo name.
#######################################
function _main()
{
	local SPECIALIZATION

	if [ -d "$CORDEX_HOME/repos/libs/esdoc-py-client/pyesdoc/mp/specializations/cordex" ]; then
		rm -rf "$CORDEX_HOME/repos/libs/esdoc-py-client/pyesdoc/mp/specializations/cordex"
	fi
	mkdir -p "$CORDEX_HOME/repos/libs/esdoc-py-client/pyesdoc/mp/specializations/cordex"

	for SPECIALIZATION in "${CORDEXP_SPECIALIZATIONS[@]}"
	do
		_do "$SPECIALIZATION"
	done
}

function _do()
{
	local SPECIALIZATION=${1}
	local PATH_TO_REPO

	PATH_TO_REPO="$CORDEX_HOME/repos/specializations/$SPECIALIZATION"

	cp "$PATH_TO_REPO"/*.py \
	   "$CORDEX_HOME/repos/libs/esdoc-py-client/pyesdoc/mp/specializations/cordex"

	cp "$PATH_TO_REPO/_$SPECIALIZATION.js" \
	   "$CORDEX_HOME/repos/libs/esdoc-web-view-specialization/data/cordex_$SPECIALIZATION.js"

	mkdir -p "$CORDEX_HOME/repos/libs/esdoc-docs/cordex/models/config"
	cp "$PATH_TO_REPO/_$SPECIALIZATION.json" \
	   "$CORDEX_HOME/repos/libs/esdoc-docs/cordex/models/config/$SPECIALIZATION.json"

	mkdir -p "$CORDEX_HOME/repos/libs/esdoc-docs/cordex/models/mindmaps"
	cp "$PATH_TO_REPO/_$SPECIALIZATION.mm" \
	   "$CORDEX_HOME/repos/libs/esdoc-docs/cordex/models/mindmaps/$SPECIALIZATION.mm"

	log "synced tooling: $SPECIALIZATION"
}

# Invoke entry point.
_main
