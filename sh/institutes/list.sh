#!/bin/bash

# Main entry point.
main()
{
	pipenv run python $CORDEXP_LIB/institutes/list.py
}

# Import utils.
source $CORDEXP_BASH/utils.sh

# Invoke entry point.
main