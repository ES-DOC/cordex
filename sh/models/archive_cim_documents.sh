#!/usr/bin/env bash

# Main entry point.
function _main()
{
	local ARCHIVE_FOLDER 
	
	ARCHIVE_FOLDER=$CORDEX_HOME/repos/archives/esdoc-archive/esdoc/cordexp/spreadsheet-models
	if [ ! -d "$ARCHIVE_FOLDER" ]; then
		mkdir -p "$ARCHIVE_FOLDER"
	fi

	rm -rf "$ARCHIVE_FOLDER"/*.*

	pushd "$CORDEX_HOME" || exit
	pipenv run python "$CORDEX_HOME/lib/models/archive_cim_documents.py" --destination="$ARCHIVE_FOLDER"
	popd || exit
}

# Invoke entry point.
_main
