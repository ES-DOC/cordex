#!/usr/bin/env bash

#######################################
# Main entry point.
# Globals:
#   CORDEX_HOME - path to cordex shell home directory.
#   CORDEX_SPECIALIZATIONS - array of specializations.
#######################################
function main()
{
	local PATH_TO_REPO
	local SPECIALIZATION
	
	for SPECIALIZATION in "${CORDEX_SPECIALIZATIONS[@]}"
	do
		PATH_TO_REPO="$CORDEX_HOME/repos/specializations/$SPECIALIZATION"
		activate_venv
		pipenv run python "$PATH_TO_REPO"/validate
		deactivate_venv
	done
}

# Invoke entry point.
main
