#!/usr/bin/env bash

# Main entry point.
function main()
{
	local institution=${1}

	echo "TODO: reactivate JSON generation script"
	activate_venv
	# pipenv run python $"$CORDEX_HOME"/lib/parties/generate_json.py --institution-id=$institution
}

# Invoke entry point.
main ${1:-"all"}
