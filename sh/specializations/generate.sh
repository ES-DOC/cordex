#!/usr/bin/env bash

#######################################
# Generates specialization artefacts.
# Globals:
#   CORDEX_HOME - path to cordex shell home directory.
#   CORDEX_SPECIALIZATIONS - array of specializations.
#######################################
function main()
{
	local SPECIALIZATION
	local REPO_NAME=${1}
	local PATH_TO_REPO

	for SPECIALIZATION in "${CORDEX_SPECIALIZATIONS[@]}"
	do
		PATH_TO_REPO="$CORDEX_HOME/repos/specializations/$SPECIALIZATION"
		log "generating $REPO_NAME"
		pushd "$CORDEX_HOME" || exit
		pipenv run python "$PATH_TO_REPO"/generate
		popd || exit
	done
}

# Invoke entry point.
main
