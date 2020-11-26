#!/bin/bash

# Main entry point.
main()
{
    for institute in "${INSTITUTE[@]}"
    do
        if [ -d $ESDOC_INSTITUTIONAL_HOME/$institute ]; then
            rm -rf $ESDOC_INSTITUTIONAL_HOME/$institute
        fi
        log "GH : cloning repo: "$institute
        pushd $ESDOC_INSTITUTIONAL_HOME
        git clone https://github.com/ES-DOC-INSTITUTIONAL/$institute.git > /dev/null
        popd -1
    done
}

# Import utils.
source $CORDEXP_PATH_SH/utils.sh

# Invoke entry point.
main
