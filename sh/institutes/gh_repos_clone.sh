#!/bin/bash

# Main entry point.
main()
{
    if [ ! -d $ESDOC_INSTITUTIONAL_HOME ]; then
        mkdir $ESDOC_INSTITUTIONAL_HOME
    fi

    pushd $ESDOC_INSTITUTIONAL_HOME
    for institute in "${INSTITUTE[@]}"
    do
        if [ ! -d $ESDOC_INSTITUTIONAL_HOME/$institute ]; then
            log "GH : cloning repo: "$institute
            git clone https://github.com/ES-DOC-INSTITUTIONAL/$institute.git > /dev/null
        else
            log "GH : pulling repo: "$institute
            pushd $ESDOC_INSTITUTIONAL_HOME/$institute
            git pull > /dev/null
            popd -1
        fi
    done
    popd -1
}

# Import utils.
source $CORDEXP_PATH_SH/utils.sh

# Invoke entry point.
main
