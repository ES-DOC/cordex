#!/usr/bin/env bash

# Main entry point.
function main()
{
	local INSTITUTION=${1:-"all"}
	local TEMPLATE

	echo $INSTITUTION

	# TEMPLATE="$CORDEX_HOME/templates/citations.xlsx"

	# if [ ! -f "$TEMPLATE" ]; then
	# 	log "citations template not found"
	# 	exit 1
	# fi

	# if [ "$INSTITUTION" == "all" ]; then
	# 	for INSTITUTION in "${CORDEX_INSTITUTION_ID[@]}"
	# 	do
	# 		do_copy_template "$INSTITUTION" "$TEMPLATE"
	# 	done	
	# else
	# 	do_copy_template "$INSTITUTION" "$TEMPLATE"
	# fi
}

function do_copy_template() 
{
	local INSTITUTION=${1}
	local TEMPLATE=${2}
	local DEST

	DEST="cordex_${INSTITUTION}_citations.xlsx"
	DEST="$CORDEX_HOME/repos/institutions/${INSTITUTION}/cordex/citations/$DEST"

	cp "$TEMPLATE" "$DEST"
	log "initialised citations XLS :: $INSTITUTION"
}

# Invoke entry point.
main "$1"
