#!/bin/bash

# Main entry point.
main()
{
	# Sync data files.
	for specialization in "${CORDEXP_SPECIALIZATIONS[@]}"
	do
		cp -r $CORDEXP_ROOT/cordexp-specializations-$specialization/_$specialization.js $ESDOC_DIR_REPOS_CORE/esdoc-web-view-specialization/data/cordexp_$specialization.js
	done
}

# Invoke entry point.
main
