#!/usr/bin/env bash

# Main entry point.
function main()
{
	activate_venv
	pipenv run python $"$CORDEX_HOME/lib/institutes/gh_repos_create.py"
	deactivate_venv
}

# Invoke entry point.
main
