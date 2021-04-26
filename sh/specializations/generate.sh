#!/usr/bin/env bash

#######################################
# Generates specialization artefacts.
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
		log "generating $SPECIALIZATION"
		activate_venv
		pipenv run python "$PATH_TO_REPO"/generate
		popd || exit
	done
}

# Invoke entry point.
main
