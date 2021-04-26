#!/usr/bin/env bash

# Main entry point.
function main()
{
	local INSTITUTION=${1}

	cordex_venv_activate
	pipenv run python $"$CORDEX_HOME"/lib/parties/generate_json.py --institution-id="$INSTITUTION"
	cordex_venv_deactivate
}

# Invoke entry point.
main "${1:-"all"}"