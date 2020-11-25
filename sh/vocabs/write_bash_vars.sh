#!/bin/bash

# Main entry point.
main()
{
	local output_fpath=$CORDEXP_BASH/vocabs/write_bash_vars_output.txt
	local template_fpath=$CORDEXP_TEMPLATES/bash_vars
	
	pipenv run python $CORDEXP_LIB/vocabs/write_bash_vars.py \
		--output-fpath=$output_fpath \
		--template-fpath=$template_fpath

	cp $output_fpath $CORDEXP_BASH/vocabs/definitions.sh
	rm $output_fpath

	log "cordexp vocabs bash file written to "$CORDEXP_BASH/vocabs/definitions.sh
}

# Import utils.
source $CORDEXP_BASH/utils.sh

# Invoke entry point.
main