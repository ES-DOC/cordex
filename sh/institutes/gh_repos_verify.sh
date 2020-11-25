#!/bin/bash

# Main entry point.
main()
{
	if [ "$1" ]; then
		institution=$1
	else
		institution=all
	fi

	pipenv run python $CORDEXP_LIB/institutes/gh_repos_verify.py --institution-id=$1
}

# Import utils.
source $CORDEXP_BASH/utils.sh

# Invoke entry point.
main $1