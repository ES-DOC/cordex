#!/bin/bash

# Main entry point.
main()
{
	if [ "$1" ]; then
		declare specialization=$1
		log_banner
		log "generating "$specialization
		log_banner
		python $CORDEXP_ROOT/cordexp-specializations-$specialization/generate
	else
		for specialization in "${CORDEXP_SPECIALIZATIONS[@]}"
		do
			log_banner
			log "generating "$specialization
			log_banner
			python $CORDEXP_ROOT/cordexp-specializations-$specialization/generate
		done
	fi
}

# Invoke entry point.
main $1
