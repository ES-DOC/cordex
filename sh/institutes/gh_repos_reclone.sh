#!/bin/bash

# Main entry point.
main()
{
    for institute in "${INSTITUTE[@]}"
    do
        if [ -d $CORDEX_PATH_REPOS_INST/$institute ]; then
            rm -rf $CORDEX_PATH_REPOS_INST/$institute
        fi
        log "GH : cloning repo: "$institute
        pushd $CORDEX_PATH_REPOS_INST
        git clone https://github.com/ES-DOC-INSTITUTIONAL/$institute.git > /dev/null
        popd -1
    done
}

# Import utils.
source $CORDEX_PATH_SH/utils.sh

# Invoke entry point.
main
