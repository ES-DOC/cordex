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

		activate_venv
		pipenv run python "$CORDEX_HOME/lib/models/generate_xls" --institution-id="$INSTITUTION" --model-id="$RCM_MODEL"
		popd || exit		
	done

	# activate_venv
	# pipenv run python "$CORDEX_HOME/lib/models/generate_xls" --institution-id="$INSTITUTION"
	# popd || exit
}

# Invoke entry point.
main
