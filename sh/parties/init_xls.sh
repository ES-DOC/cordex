#!/usr/bin/env bash

# Main entry point.
function _main()
{
	local INSTITUTION=${1:-"all"}
	local PATH_TO_TEMPLATE

	PATH_TO_TEMPLATE="$CORDEX_HOME/templates/parties.xlsx"
	if [ ! -f "$PATH_TO_TEMPLATE" ]; then
		log "parties template not found"
		exit 1
	fi

	if [ "$INSTITUTION" == "all" ]; then
		for INSTITUTION in "${CORDEXP_INSTITUTION_ID[@]}"
		do
			_do "$INSTITUTION" "$PATH_TO_TEMPLATE"
		done	
	else
		_do "$INSTITUTION" "$PATH_TO_TEMPLATE"
	fi
}

function _get_fname()
{
	local INSTITUTION=${1}

	echo "cordexp_${INSTITUTION}_parties.xlsx" | tr '-' '_'
}

function _do() 
{
	local INSTITUTION=${1}
	local PATH_TO_TEMPLATE=${2}
	local FNAME	
	local PATH_TO_DEST_FOLDER
	local PATH_TO_DEST_FILE

	PATH_TO_DEST_FOLDER="$CORDEX_HOME/repos/institutions/${INSTITUTION}/cordexp/parties"
	mkdir -p "$PATH_TO_DEST_FOLDER"

	FNAME=$(_get_fname "$INSTITUTION")
	PATH_TO_DEST_FILE="$PATH_TO_DEST_FOLDER/$FNAME"
	cp "$PATH_TO_TEMPLATE" "$PATH_TO_DEST_FILE"

	log "initialised parties XLS :: $INSTITUTION"
}

# Invoke entry point.
_main "$1"
