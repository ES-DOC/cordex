#!/usr/bin/env bash

# Main entry point.
function main()
{
	local INSTITUTION=${1}

	activate_venv
	pipenv run python $"$CORDEX_HOME"/lib/citations/generate_json.py --institution-id="$INSTITUTION"
	deactivate_venv
}

# Invoke entry point.
main "${1:-"all"}"
