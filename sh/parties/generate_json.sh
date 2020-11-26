#!/bin/bash

# Main entry point.
main()
{
	local institution=${1:-"all"}

	echo "TODO: reactivate JSON generation script"
	# pipenv run python $CORDEXP_PATH_LIB/parties/generate_json.py --institution-id=$institution
}

# Import utils.
source $CORDEXP_PATH_SH/utils.sh

# Invoke entry point.
main $1
