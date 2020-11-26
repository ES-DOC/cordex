#!/bin/bash

# Main entry point.
main()
{
	local institution=${1:-"all"}

	export PYTHONPATH=$CORDEXP_PATH_REPOS/esdoc-py-client:$PYTHONPATH
	pipenv run python $CORDEXP_LIB/models/generate_xls --institution-id=$institution
}

# Import utils.
source $CORDEXP_BASH/utils.sh

# Invoke entry point.
main $1
