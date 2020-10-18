#!/bin/bash

# Main entry point.
main()
{
	if [ "$1" ]; then
		declare specialization=$1
		python $CORDEXP_ROOT/cordexp-specializations-$specialization/validate
	else
		for specialization in "${CORDEXP_SPECIALIZATIONS[@]}"
		do
			python $CORDEXP_ROOT/cordexp-specializations-$specialization/validate
		done
	fi
}

# Invoke entry point.
main $1
