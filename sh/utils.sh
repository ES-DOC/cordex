#!/bin/bash

# ###############################################################
# SECTION: INITIALIZE PATHS / VARS
# ###############################################################

# Vars.
source $ESDOC_HOME/bash/utils_vars.sh

# Vocabs.
source $CORDEXP_BASH/vocabs/definitions.sh

# ###############################################################
# SECTION: HELPER FUNCTIONS
# ###############################################################

# Activates a virtual environment.
activate_venv()
{
	export PYTHONPATH=$CORDEXP_HOME:$PYTHONPATH
	pushd $CORDEXP_HOME	
}

# Wraps standard echo by adding ESDOC prefix.
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
	    	echo -e $now" [INFO] :: CORDEXP :: "$tabs$1
	    else
	    	echo -e $now" [INFO] :: CORDEXP :: "$1
	    fi
	else
	    echo -e $now" [INFO] :: CORDEXP :: "
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

#######################################
# Command execution begin.
#######################################
on_cmd_begin()
{
	log_banner
	log $1" :: BEGINS"
	activate_venv
	log_banner
}

#######################################
# Command execution end.
#######################################
on_cmd_end()
{
	log_banner
	deactivate
	log $1" :: ENDS"
	log_banner
}


