#!/usr/bin/env bash

# Main entry point.
function main()
{
	local INSTITUTION=${1}

	activate_venv
	pipenv run python "$CORDEX_HOME/lib/models/generate_xls" --institution-id="$INSTITUTION"
	deactivate_venv
}

# Invoke entry point.
main "${1:-"all"}"
