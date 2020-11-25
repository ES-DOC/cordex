#!/bin/bash

# Main entry point.
main()
{
	pipenv run python $CORDEXP_LIB/institutes/list.py
}

# Invoke entry point.
main