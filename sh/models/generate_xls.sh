#!/bin/bash

# Main entry point.
main()
{
	local institution=${1:-"all"}

	export PYTHONPATH=$CORDEX_PATH_REPOS/esdoc-py-client:$PYTHONPATH
	pipenv run python $CORDEX_PATH_LIB/models/generate_xls --institution-id=$institution
}

# Import utils.
source $CORDEX_PATH_SH/utils.sh

# Invoke entry point.
main $1
