#!/bin/bash

# Main entry point.
main()
{
	activate_venv
	pipenv run python $CORDEX_PATH_LIB/institutes/gh_repos_create.py
}

# Import utils.
source $CORDEX_PATH_SH/utils.sh

# Invoke entry point.
main
