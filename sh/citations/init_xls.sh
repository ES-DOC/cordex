#!/bin/bash

function do_copy_citations_xls_template() 
{
	local institute=${1}
	local template=$CORDEX_PATH_TEMPLATES/citations.xlsx
	local dest_fname=cordex_${institute}_citations.xlsx
	local dest=$CORDEX_PATH_REPOS_INST/$institute/cordex/citations/$dest_fname

	cp $template $dest
	log "initialised citations XLS :: "$institute
}

# Main entry point.
function main()
{
	local institution=${1:-"all"}
	local xls_template=$CORDEX_PATH_TEMPLATES/citations.xlsx

	if [ ! -f $xls_template ]; then
		log "citations template not found"
		exit 1
	fi

	if [ $institution == "all" ]; then
		for institute in "${INSTITUTE[@]}"
		do
			do_copy_citations_xls_template $institute
		done	
	else
		do_copy_citations_xls_template $institution
	fi
}

# Import utils.
source $CORDEX_PATH_SH/utils.sh

# Invoke entry point.
main $1
