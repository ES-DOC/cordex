#!/usr/bin/env bash

# Main entry point.
function main()
{
	cordex_venv_activate
	pipenv run python $"$CORDEX_HOME/lib/institutes/gh_repos_create.py"
	cordex_venv_deactivate
}

# Invoke entry point.
main
