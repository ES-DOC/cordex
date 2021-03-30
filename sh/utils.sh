#!/usr/bin/env bash

# ###############################################################
# SECTION: INITIALIZE PATHS / VARS
# ###############################################################

# Vocabs.
source $"$CORDEX_HOME"/sh/vocabs/definitions.sh

# ###############################################################
# SECTION: HELPER FUNCTIONS
# ###############################################################

# Activates a virtual environment.
activate_venv()
{
	pushd $CORDEX_HOME
	export PYTHONPATH=$CORDEX_HOME:$PYTHONPATH
	export PYTHONPATH=$CORDEX_HOME/repos/libs/esdoc-py-client:$PYTHONPATH
	export PYTHONPATH=$CORDEX_HOME/repos/libs/pyessv:$PYTHONPATH
}

# Wraps standard echo by adding prefix.
log()
{
	declare now=`date +%Y-%m-%dT%H:%M:%S:000000`
	declare tabs=''
	if [ "$1" ]; then
		if [ "$2" ]; then
			for ((i=0; i<$2; i++))
			do
				declare tabs+='\t'
			done
	    	echo -e $now" [INFO] :: CORDEX :: "$tabs$1
	    else
	    	echo -e $now" [INFO] :: CORDEX :: "$1
	    fi
	else
	    echo -e $now" [INFO] :: CORDEX :: "
	fi
}

# Outputs a line to split up logging.
log_banner()
{
	echo "-------------------------------------------------------------------------------"
}

#######################################
# Wraps pushd command to suppress stdout.
#######################################
function pushd ()
{
    command pushd "$@" > /dev/null
}

#######################################
# Wraps popd command to suppress stdout.
#######################################
function popd ()
{
    command popd "$@" > /dev/null
}
