#!/usr/bin/env bash

# Main entry point.
function _main()
{
	local INSTITUTION=${1}

	pushd "$CORDEX_HOME" || exit
	pipenv run python "$CORDEX_HOME/lib/models/generate_cim.py" --institution-id="$INSTITUTION"
	popd || exit
}

# Invoke entry point.
_main "${1:-"all"}"
