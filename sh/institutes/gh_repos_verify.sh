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

# Invoke entry point.
main $1