#!/usr/bin/env bash

#######################################
# Main entry point.
# Globals:
#   CORDEX_SPECIALIZATIONS - array of specializations.
#######################################
function main()
{
	local PATH_TO_REPO
	local SPECIALIZATION
	
	for SPECIALIZATION in "${CORDEX_SPECIALIZATIONS[@]}"
	do
		echo $SPECIALIZATION 
		# PATH_TO_REPO="$CORDEX_HOME/repos/specializations/$SPECIALIZATION"
		# activate_venv
		# pipenv run python "$PATH_TO_REPO"/validate
	done
}

# Invoke entry point.
main
