#!/bin/bash

# Main entry point.
main()
{
	activate_venv
	pipenv run python $CORDEXP_PATH_LIB/institutes/gh_repos_create.py
}

# Import utils.
source $CORDEXP_PATH_SH/utils.sh

# Invoke entry point.
main
