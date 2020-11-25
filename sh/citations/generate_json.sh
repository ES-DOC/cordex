#!/bin/bash

# Main entry point.
main()
{
	local institution=${1:-"all"}

	echo "TODO: reactivate JSON generation script"
	# pipenv run python $CORDEXP_LIB/citations/generate_json.py --institution-id=$institution
}

# Import utils.
source $CORDEXP_BASH/utils.sh

# Invoke entry point.
main $1
