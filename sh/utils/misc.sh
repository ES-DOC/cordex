#!/usr/bin/env bash

# Activates associated virtual environment.
cordex_venv_activate()
{
	pushd "$CORDEX_HOME" || exit
	export PYTHONPATH=$CORDEX_HOME:$PYTHONPATH
	export PYTHONPATH=$CORDEX_HOME/repos/libs/esdoc-py-client:$PYTHONPATH
	export PYTHONPATH=$CORDEX_HOME/repos/libs/pyessv:$PYTHONPATH
}

# Deactivates associated virtual environment.
cordex_venv_deactivate()
{
	popd || exit
}

# Wraps standard echo.
function log()
{
	local NOW
	local TABS

	NOW=$(date +%Y-%m-%dT%H:%M:%S:000000)
	TABS=''

	if [ "$1" ]; then
		if [ "$2" ]; then
			for ((i=0; i<$2; i++))
			do
				TABS+='\t'
			done
	    	echo -e "$NOW [INFO] :: CORDEX :: $TABS$1"
	    else
	    	echo -e "$NOW [INFO] :: CORDEX :: $1"
	    fi
	else
	    echo -e "$NOW [INFO] :: CORDEX :: "
	fi
}

# Outputs a line to split up logging.
function log_banner()
{
	echo "-------------------------------------------------------------------------------"
}

# Event handler: on command execution start.
function on_cmd_begin()
{
	local MSG=${1}

	log_banner
	log "$MSG :: BEGINS"
	log_banner
}

# Event handler: on command execution completion.
function on_cmd_end()
{
	local MSG=${1}

	log_banner
	log "$MSG :: ENDS"
	log_banner
}

# Wraps pushd command to suppress stdout.
function pushd () {
    command pushd "$@" > /dev/null
}

# Wraps popd command to suppress stdout.
function popd () {
    command popd "$@" > /dev/null
}
