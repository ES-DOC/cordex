#!/bin/bash

function do_copy_parties_xls_template() 
{
	local institute=${1}
	local template=$CORDEXP_PATH_TEMPLATES/parties.xlsx
	local dest_fname=cordexp_${institute}_parties.xlsx
	local dest=$ESDOC_INSTITUTIONAL_HOME/$institute/cordexp/parties/$dest_fname

	cp $template $dest
	log "initialised parties XLS :: "$institute
}

# Main entry point.
function main()
{
	local institution=${1:-"all"}
	local xls_template=$CORDEXP_PATH_TEMPLATES/parties.xlsx

	if [ ! -f $xls_template ]; then
		log "parties template not found"
		exit 1
	fi

	if [ $institution == "all" ]; then
		for institute in "${INSTITUTE[@]}"
		do
			do_copy_parties_xls_template $institute
		done	
	else
		do_copy_parties_xls_template $institution
	fi
}

# Import utils.
source $CORDEXP_PATH_SH/utils.sh

# Invoke entry point.
main $1
