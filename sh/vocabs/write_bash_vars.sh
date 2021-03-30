#!/usr/bin/env bash

# Main entry point.
function main()
{
	local output_fpath=$"$CORDEX_HOME"/sh/vocabs/write_bash_vars_output.txt
	local template_fpath=$"$CORDEX_HOME"/templates/bash_vars
	
	activate_venv
	pipenv run python $"$CORDEX_HOME"/lib/vocabs/write_bash_vars.py \
		--output-fpath=$output_fpath \
		--template-fpath=$template_fpath

	cp $output_fpath $"$CORDEX_HOME"/sh/vocabs/definitions.sh
	rm $output_fpath

	log "cordex vocabs bash file written to "$"$CORDEX_HOME"/sh/vocabs/definitions.sh
}

# Invoke entry point.
main