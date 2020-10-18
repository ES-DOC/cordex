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

# Invoke entry point.
main $1
