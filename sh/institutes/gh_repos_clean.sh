#!/bin/bash

function do_clean() {
    local institute=${1}

    pushd $ESDOC_INSTITUTIONAL_HOME/$institute

    rm -rf $ESDOC_INSTITUTIONAL_HOME/$institute/cordexp/responsible_parties

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

# Invoke entry point.
main
