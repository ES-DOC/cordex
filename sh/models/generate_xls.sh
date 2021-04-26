#!/usr/bin/env bash

# Main entry point.
function main()
{
	local INSTITUTION
	local DEFINITION
	local RCM_MODEL
	local IFS

	IFS=":"
	for ROW in "${CORDEXP_RCM_MODEL[@]}"
	do
		read -ra DEFINITION <<< "$(echo -e "${ROW[0]}" | tr -d '[:space:]')"
		INSTITUTION=${DEFINITION[0]}
		RCM_MODEL=${DEFINITION[1]}

		cordex_venv_activate
		pipenv run python "$CORDEX_HOME/lib/models/generate_xls" --institution-id="$INSTITUTION" --model-id="$RCM_MODEL"
		cordex_venv_deactivate
	done

	# cordex_venv_activate
	# pipenv run python "$CORDEX_HOME/lib/models/generate_xls" --institution-id="$INSTITUTION"
	# cordex_venv_deactivate
}

# Invoke entry point.
main
