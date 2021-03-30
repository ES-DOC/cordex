#!/usr/bin/env bash

# Main entry point.
function main()
{
    for institute in "${INSTITUTE[@]}"
    do
        if [ -d "$CORDEX_HOME"/repos/institutions/$institute ]; then
            rm -rf "$CORDEX_HOME"/repos/institutions/$institute
        fi
        log "GH : cloning repo: "$institute
        pushd "$CORDEX_HOME"/repos/institutions
        git clone https://github.com/ES-DOC-INSTITUTIONAL/$institute.git > /dev/null
        popd 1
    done
}

# Invoke entry point.
main
