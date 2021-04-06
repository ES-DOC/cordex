#!/usr/bin/env bash

# Main entry point.
function main()
{
	activate_venv
	pipenv run python "$CORDEX_HOME/lib/institutes/list.py"
	deactivate_venv
}

# Invoke entry point.
main