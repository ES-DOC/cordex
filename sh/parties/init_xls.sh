#!/usr/bin/env bash

function do_copy_parties_xls_template() 
{
	local institute=${1}
	local template=$"$CORDEX_HOME"/templates/parties.xlsx
	local dest_fname=cordex_${institute}_parties.xlsx
	local dest="$CORDEX_HOME"/repos/institutions/$institute/cordex/parties/$dest_fname

	cp $template $dest
	log "initialised parties XLS :: "$institute
}

# Main entry point.
function main()
{
	local institution=${1:-"all"}
	local xls_template=$"$CORDEX_HOME"/templates/parties.xlsx

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
source $"$CORDEX_HOME"/sh/utils.sh

# Invoke entry point.
main $1
