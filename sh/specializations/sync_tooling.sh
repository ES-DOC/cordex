#!/bin/bash

# Main entry point.
main()
{
	# Sync definitions.
	for specialization in "${CORDEXP_REALM_SPECIALIZATIONS[@]}"
	do
		# ... generator
		rm -rf $CORDEXP_ROOT/cordexp-specializations-$specialization/generate
		mkdir $CORDEXP_ROOT/cordexp-specializations-$specialization/generate
		cp -r $CORDEXP_ROOT/cordexp-specializations-toplevel/generate/* $CORDEXP_ROOT/cordexp-specializations-$specialization/generate

		# ... validator
		rm -rf $CORDEXP_ROOT/cordexp-specializations-$specialization/validate
		mkdir $CORDEXP_ROOT/cordexp-specializations-$specialization/validate
		cp -r $CORDEXP_ROOT/cordexp-specializations-toplevel/validate/* $CORDEXP_ROOT/cordexp-specializations-$specialization/validate

		log "... synced: "$specialization
	done
}

# Import utils.
source $CORDEXP_BASH/utils.sh

# Invoke entry point.
main
