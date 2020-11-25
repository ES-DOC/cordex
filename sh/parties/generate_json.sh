#!/bin/bash

# Main entry point.
main()
{
	if [ "$1" ]; then
		local institution=$1
	else
		local institution=all
	fi

	echo "TODO: reactivate JSON generation script"
	# pipenv run python $CORDEXP_LIB/parties/generate_json.py --institution-id=$institution
}

# Import utils.
source $CORDEXP_BASH/utils.sh

# Invoke entry point.
main $1
