#!/bin/bash

# Main entry point.
main()
{
	for specialization in "${CORDEXP_SPECIALIZATIONS[@]}"
	do
		log_banner
		log "pulling "$specialization
		log_banner
		cd $CORDEXP_ROOT/cordexp-specializations-$specialization
		git pull
	done
}

# Invoke entry point.
main
