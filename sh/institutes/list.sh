#!/usr/bin/env bash

# Main entry point.
function main()
{
	activate_venv
	pipenv run python $"$CORDEX_HOME"/lib/institutes/list.py
}

# Import utils.
source $"$CORDEX_HOME"/sh/utils.sh

# Invoke entry point.
main