#!/bin/bash

# Main entry point.
main()
{
	local output_fpath=$CORDEX_PATH_SH/vocabs/write_bash_vars_output.txt
	local template_fpath=$CORDEX_PATH_TEMPLATES/bash_vars
	
	pipenv run python $CORDEX_PATH_LIB/vocabs/write_bash_vars.py \
		--output-fpath=$output_fpath \
		--template-fpath=$template_fpath

	cp $output_fpath $CORDEX_PATH_SH/vocabs/definitions.sh
	rm $output_fpath

	log "cordex vocabs bash file written to "$CORDEX_PATH_SH/vocabs/definitions.sh
}

# Import utils.
source $CORDEX_PATH_SH/utils.sh

# Invoke entry point.
main