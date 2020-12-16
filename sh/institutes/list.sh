#!/bin/bash

# Main entry point.
main()
{
	pipenv run python $CORDEX_PATH_LIB/institutes/list.py
}

# Import utils.
source $CORDEX_PATH_SH/utils.sh

# Invoke entry point.
main