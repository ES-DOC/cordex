#!/usr/bin/env bash

#######################################
# Generates various specialisation assets definitions.
# Globals:
#   CORDEX_HOME - path to cordex shell.
# Arguments:
#   Specialization repo name.
#######################################
function _do_generate()
{
	local REPO_NAME=${1}
	local PATH_TO_REPO

	PATH_TO_REPO="$CORDEX_HOME"/repos/specializations/"$REPO_NAME"

	log "generating $REPO_NAME"
	activate_venv
	pipenv run python "$PATH_TO_REPO"/generate
}

#######################################
# Main entry point.
# Globals:
#   CORDEX_SPECIALIZATIONS - array of specializations.
#######################################
function main()
{
	local SPECIALIZATION

	for SPECIALIZATION in "${CORDEX_SPECIALIZATIONS[@]}"
	do
		_do_generate "cordex-specializations-$SPECIALIZATION"
	done
}

# Invoke entry point.
main
