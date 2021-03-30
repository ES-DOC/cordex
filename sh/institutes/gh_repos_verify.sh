#!/usr/bin/env bash

# Main entry point.
function main()
{
	local institution=${1}

	activate_venv
	pipenv run python $"$CORDEX_HOME"/lib/institutes/gh_repos_verify.py --institution-id=$institution
}

# Import utils.
source $"$CORDEX_HOME"/sh/utils.sh

# Invoke entry point.
main ${1:-"all"}
