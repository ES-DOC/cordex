#!/bin/bash

# Main entry point.
main()
{
	local institution=${1:-"all"}

	pipenv run python $CORDEX_PATH_LIB/institutes/gh_repos_verify.py --institution-id=$institution
}

# Import utils.
source $CORDEX_PATH_SH/utils.sh

# Invoke entry point.
main $1