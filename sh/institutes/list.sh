#!/bin/bash

# Main entry point.
main()
{
	pipenv run python $CORDEXP_PATH_LIB/institutes/list.py
}

# Import utils.
source $CORDEXP_PATH_SH/utils.sh

# Invoke entry point.
main