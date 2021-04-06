#!/usr/bin/env bash

#######################################
# Validates specialization artefacts.
# Globals:
#   CORDEX_HOME - path to cordex shell home directory.
#   CORDEX_SPECIALIZATIONS - array of specializations.
#######################################
function main()
{
	local SPECIALIZATION
	local PATH_TO_REPO

	for SPECIALIZATION in "${CORDEX_SPECIALIZATIONS[@]}"
	do
		PATH_TO_REPO="$CORDEX_HOME/repos/specializations/$SPECIALIZATION"
		log "validating $SPECIALIZATION"
		activate_venv
		pipenv run python "$PATH_TO_REPO"/validate
		popd || exit
	done
}

# Invoke entry point.
main "$1"
