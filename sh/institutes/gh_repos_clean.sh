#!/usr/bin/env bash

function do_clean() {
    local institute=${1}

    pushd "$CORDEX_HOME"/repos/institutions/$institute

    echo "$CORDEX_HOME"/repos/institutions/$institute/cordex/models

    popd 1

}

# Main entry point.
function main()
{
	for institute in "${INSTITUTE[@]}"
	do
        if [ -d "$CORDEX_HOME"/repos/institutions/$institute ]; then
            do_clean $institute
        fi
	done
}

# Invoke entry point.
main
