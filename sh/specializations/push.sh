#!/bin/bash

# Main entry point.
main()
{
	declare comment=$1

	# Push specializations.
	for specialization in "${CORDEXP_SPECIALIZATIONS[@]}"
	do
		log "pushing "$specialization
		cd $CORDEXP_ROOT/cordexp-specializations-$specialization
		git add .
		git commit -m $comment
		git push -v origin master:master
	done

	# Push viewer.
	cd $ESDOC_HOME/repos/esdoc-web-view-specialization
	git add .
	git commit -m $comment
	git push -v origin master:master
}

# Invoke entry point.
main $1
