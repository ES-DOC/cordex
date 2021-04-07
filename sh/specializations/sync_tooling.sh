#!/usr/bin/env bash

#######################################
# Syncs specializations tooling from toplevel.
# Globals:
#   CORDEX_HOME - path to cordex home folder.
# Arguments:
#   Specialization repo name.
#######################################
function _do()
{
	local SPECIALIZATION=${1}
	local PATH_TO_REPO
	local PATH_TO_REPO_TOPLEVEL

	PATH_TO_REPO="$CORDEX_HOME/repos/specializations/$SPECIALIZATION"
	PATH_TO_REPO_TOPLEVEL="$CORDEX_HOME/repos/specializations/toplevel"

	# Non toplevel specialisations.
	if [ "$SPECIALIZATION" != "toplevel" ]; then
		# ... sync generator
		if [ -d "$PATH_TO_REPO/generate" ]; then
			rm -rf "$PATH_TO_REPO/generate"
		fi
		cp -r "$PATH_TO_REPO_TOPLEVEL/generate" "$PATH_TO_REPO"
	
		# ... sync validator
		if [ -d "$PATH_TO_REPO/validate" ]; then
			rm -rf "$PATH_TO_REPO/validate"
		fi
		cp -r "$PATH_TO_REPO_TOPLEVEL/validate" "$PATH_TO_REPO"

		# ... sync templates
		if [ -d "$PATH_TO_REPO/templates" ]; then
			rm -rf "$PATH_TO_REPO/templates"
		fi
		cp -r "$PATH_TO_REPO_TOPLEVEL/templates" "$PATH_TO_REPO"
	fi

	log "synced tooling: $SPECIALIZATION"
}

#######################################
# Main entry point.
# Globals:
#   CORDEX_SPECIALIZATIONS - array of specializations.
#######################################
function main()
{
	local SPECIALIZATION
	local PATH_TO_PYESDOC_MP

	PATH_TO_PYESDOC_MP="$CORDEX_HOME/repos/libs/esdoc-py-client/pyesdoc/mp/specializations/cordex"
	if [ -d "$PATH_TO_PYESDOC_MP" ]; then
		rm -rf "$PATH_TO_PYESDOC_MP"
	fi
	mkdir -p "$PATH_TO_PYESDOC_MP"

	for SPECIALIZATION in "${CORDEX_SPECIALIZATIONS[@]}"
	do
		_do "$SPECIALIZATION"
	done
}

# Invoke entry point.
main
