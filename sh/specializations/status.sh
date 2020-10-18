#!/bin/bash

# Main entry point.
main()
{
	for specialization in "${CORDEXP_SPECIALIZATIONS[@]}"
	do
		log_banner
		log "status : "$specialization
		log_banner
		cd $CORDEXP_ROOT/cordexp-specializations-$specialization
		git status
	done
}

# Invoke entry point.
main
