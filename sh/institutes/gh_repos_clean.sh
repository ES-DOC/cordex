#!/bin/bash

function do_clean() {
    local institute=${1}

    pushd $ESDOC_INSTITUTIONAL_HOME/$institute

    echo $ESDOC_INSTITUTIONAL_HOME/$institute/cordexp/models

    popd -1

}

# Main entry point.
function main()
{
	for institute in "${INSTITUTE[@]}"
	do
        if [ -d $ESDOC_INSTITUTIONAL_HOME/$institute ]; then
            do_clean $institute
        fi
	done
}

# Import utils.
source $CORDEXP_PATH_SH/utils.sh

# Invoke entry point.
main
