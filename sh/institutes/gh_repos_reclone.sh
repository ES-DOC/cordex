#!/usr/bin/env bash

# Main entry point.
function main()
{
	local INSTITUTION

	for INSTITUTION in "${CORDEX_INSTITUTION_ID[@]}"
	do
        if [ -d "$CORDEX_HOME/repos/institutions/$INSTITUTION" ]; then
            rm -rf "$CORDEX_HOME/repos/institutions/$INSTITUTION"
        fi
        log "GH : cloning repo: $INSTITUTION"
        pushd "$CORDEX_HOME/repos/institutions" || exit
        git clone "https://github.com/ES-DOC-INSTITUTIONAL/$INSTITUTION.git" > /dev/null
        popd || exit
	done
}

# Invoke entry point.
main
