#!/usr/bin/env bash

#######################################
# Generates specialization artefacts.
# Globals:
#   CORDEX_HOME - path to cordex shell home directory.
#   CORDEXP_SPECIALIZATIONS - array of specializations.
#######################################
function _main()
{
	local SPECIALIZATION
	local PATH_TO_REPO

	for SPECIALIZATION in "${CORDEXP_SPECIALIZATIONS[@]}"
	do
		PATH_TO_REPO="$CORDEX_HOME/repos/specializations/$SPECIALIZATION"
		log "generating $SPECIALIZATION"
		cordex_venv_activate
		pipenv run python "$PATH_TO_REPO"/generate
		cordex_venv_deactivate
	done
}

# Invoke entry point.
_main
