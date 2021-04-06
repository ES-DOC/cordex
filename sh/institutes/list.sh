#!/usr/bin/env bash

# Main entry point.
function main()
{
	activate_venv
	pipenv run python "$CORDEX_HOME/lib/institutes/list.py"
}

# Invoke entry point.
main