#!/bin/bash

function do_copy_citations_xls_template() 
{
	local institute=${1}
	local template=$CORDEXP_TEMPLATES/citations.xlsx
	local dest_fname=cordexp_${institute}_citations.xlsx
	local dest=$ESDOC_INSTITUTIONAL_HOME/$institute/cordexp/citations/$dest_fname
	cp $template $dest
	log "initialised citations XLS :: "$institute
}

# Main entry point.
function main()
{
	local xls_template=$CORDEXP_TEMPLATES/citations.xlsx
	if [ ! -f $xls_template ]; then
		log "citations template not found"
		exit 1
	fi

	local institution=${1:-"all"}
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
source $CORDEXP_BASH/utils.sh

# Invoke entry point.
main $1
