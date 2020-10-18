#!/bin/bash

# Main entry point.
main()
{
	mkdir -p $CORDEXP_ROOT
	cd $CORDEXP_ROOT

	for specialization in "${CORDEXP_SPECIALIZATIONS[@]}"
	do
		log "cloning "$specialization
		git clone https://github.com/ES-DOC/cordexp-specializations-$specialization.git
	done
}

# Invoke entry point.
main
