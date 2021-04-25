#!/usr/bin/env bash

# Main entry point.
function main()
{
	local INSTITUTION=${1:-"all"}
	local PATH_TO_TEMPLATE

	PATH_TO_TEMPLATE="$CORDEX_HOME/templates/parties.xlsx"
	if [ ! -f "$PATH_TO_TEMPLATE" ]; then
		log "parties template not found"
		exit 1
	fi

	if [ "$INSTITUTION" == "all" ]; then
		for INSTITUTION in "${CORDEX_INSTITUTION_ID[@]}"
		do
			_do "$INSTITUTION" "$PATH_TO_TEMPLATE"
		done	
	else
		_do "$INSTITUTION" "$PATH_TO_TEMPLATE"
	fi
}

function _do() 
{
	local INSTITUTION=${1}
	local PATH_TO_TEMPLATE=${2}
	local PATH_TO_DEST_FOLDER
	local PATH_TO_DEST

	PATH_TO_DEST_FOLDER="$CORDEX_HOME/repos/institutions/${INSTITUTION}/cordex/parties"
	mkdir -p "$PATH_TO_DEST_FOLDER"

	PATH_TO_DEST_FILE="$PATH_TO_DEST_FOLDER/cordex_${INSTITUTION}_parties.xlsx"
	cp "$PATH_TO_TEMPLATE" "$PATH_TO_DEST_FILE"

	log "initialised parties XLS :: $INSTITUTION"
}

# Invoke entry point.
main "$1"
