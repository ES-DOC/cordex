#!/bin/bash

# Main entry point.
main()
{
	if [ "$1" ]; then
		institution=$1
	else
		institution=all
	fi

	python $CORDEXP_LIB/models/generate_xls --institution-id=$institution
}

# Import utils.
source $CORDEXP_BASH/utils.sh

# Invoke entry point.
main $1
