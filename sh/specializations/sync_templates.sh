#!/bin/bash

# Main entry point.
main()
{
	for specialization in "${CORDEXP_SPECIALIZATIONS[@]}"
	do
		if [ $specialization != "toplevel" ]; then
			rm -rf $CORDEXP_ROOT/cordexp-specializations-$specialization/templates
			mkdir $CORDEXP_ROOT/cordexp-specializations-$specialization/templates
			cp $CORDEXP_ROOT/cordexp-specializations-toplevel/templates/* $CORDEXP_ROOT/cordexp-specializations-$specialization/templates
		fi
	done
}

# Import utils.
source $CORDEXP_BASH/utils.sh

# Invoke entry point.
main
