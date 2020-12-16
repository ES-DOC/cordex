#!/bin/bash

function do_clean() {
    local institute=${1}

    pushd $CORDEX_PATH_REPOS_INST/$institute

    echo $CORDEX_PATH_REPOS_INST/$institute/cordex/models

    popd -1

}

# Main entry point.
function main()
{
	for institute in "${INSTITUTE[@]}"
	do
        if [ -d $CORDEX_PATH_REPOS_INST/$institute ]; then
            do_clean $institute
        fi
	done
}

# Import utils.
source $CORDEX_PATH_SH/utils.sh

# Invoke entry point.
main
