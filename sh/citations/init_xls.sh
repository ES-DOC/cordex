#!/usr/bin/env bash

function do_copy_citations_xls_template() 
{
	local institute=${1}
	local template=$"$CORDEX_HOME"/templates/citations.xlsx
	local dest_fname=cordex_${institute}_citations.xlsx
	local dest="$CORDEX_HOME"/repos/institutions/$institute/cordex/citations/$dest_fname

	cp $template $dest
	log "initialised citations XLS :: "$institute
}

# Main entry point.
function main()
{
	local institution=${1:-"all"}
	local xls_template=$"$CORDEX_HOME"/templates/citations.xlsx

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

# Invoke entry point.
main $1
