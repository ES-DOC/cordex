#!/bin/bash

# Main entry point.
main()
{
	local output_fpath=$CORDEXP_PATH_SH/vocabs/write_bash_vars_output.txt
	local template_fpath=$CORDEXP_PATH_TEMPLATES/bash_vars
	
	pipenv run python $CORDEXP_PATH_LIB/vocabs/write_bash_vars.py \
		--output-fpath=$output_fpath \
		--template-fpath=$template_fpath

	cp $output_fpath $CORDEXP_PATH_SH/vocabs/definitions.sh
	rm $output_fpath

	log "cordexp vocabs bash file written to "$CORDEXP_PATH_SH/vocabs/definitions.sh
}

# Import utils.
source $CORDEXP_PATH_SH/utils.sh

# Invoke entry point.
main