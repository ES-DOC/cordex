#!/usr/bin/env bash

# Main entry point.
function _main()
{
	local PATH_TO_DEFINITIONS
	local PATH_TO_OUTPUT_FILE
	local PATH_TO_TEMPLATE

	PATH_TO_DEFINITIONS="$CORDEX_HOME/sh/vocabs/definitions.sh"
	PATH_TO_OUTPUT_FILE="$CORDEX_HOME/sh/vocabs/write_bash_vars_output.txt"
	PATH_TO_TEMPLATE="$CORDEX_HOME/templates/bash_vars"
	
	cordex_venv_activate
	pipenv run python "$CORDEX_HOME/lib/vocabs/write_bash_vars.py" \
		--output-fpath="$PATH_TO_OUTPUT_FILE" \
		--template-fpath="$PATH_TO_TEMPLATE"
	cordex_venv_deactivate

	cp "$PATH_TO_OUTPUT_FILE" "$PATH_TO_DEFINITIONS"
	rm "$PATH_TO_OUTPUT_FILE"

	source "$PATH_TO_DEFINITIONS"

	log "cordex vocabs bash file written to $PATH_TO_DEFINITIONS"
}

# Invoke entry point.
_main