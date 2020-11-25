#!/bin/bash

# Main entry point.
main()
{
	if [ "$1" ]; then
		local institution=$1
	else
		local institution=all
	fi

	pipenv run python $CORDEXP_LIB/parties/generate_json.py --institution-id=$institution
}

# Invoke entry point.
main $1
