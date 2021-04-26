#!/usr/bin/env bash

#######################################
# Validates specialization artefacts.
# Globals:
#   CORDEX_HOME - path to cordex shell home directory.
#   CORDEXP_SPECIALIZATIONS - array of specializations.
#######################################
function main()
{
	local SPECIALIZATION
	local PATH_TO_REPO

	for SPECIALIZATION in "${CORDEXP_SPECIALIZATIONS[@]}"
	do
		PATH_TO_REPO="$CORDEX_HOME/repos/specializations/$SPECIALIZATION"
		log "validating $SPECIALIZATION"
		cordex_venv_activate
		pipenv run python "$PATH_TO_REPO"/validate
		cordex_venv_deactivate
	done
}

# Invoke entry point.
main
