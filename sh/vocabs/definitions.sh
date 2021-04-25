#!/usr/bin/env bash

# ###############################################################
# SECTION: VOCABULARY BASH VARS
# ###############################################################

# Institute - canonical name
export CORDEXP_INSTITUTION_ID=(
	'cnrm'
	'dmi'
	'gerics'
	'ictp'
	'ipsl'
	'knmi'
	'mohc'
	'mpi-csc'
	'smhi'
	'uhoh'
)

# Institute - raw name
export CORDEXP_INSTITUTION_ID_RAW=(
	'cnrm'
	'dmi'
	'gerics'
	'ictp'
	'ipsl'
	'knmi'
	'mohc'
	'mpi-csc'
	'smhi'
	'uhoh'
)

# Source ID - canonical name
export CORDEXP_RCM_MODEL=(
	'cnrm-aladin63'
	'dmi-hirham5'
	'gerics-remo2015'
	'ictp-regcm4-6'
	'ipsl-wrf381p'
	'knmi-racmo22e'
	'mohc-hadrem3-ga7-05'
	'mpi-csc-remo2009'
	'smhi-rca4'
	'uhoh-wrf361h'
)

# Source ID - raw name
export CORDEXP_RCM_MODEL_RAW=(
	'cnrm-aladin63'
	'dmi-hirham5'
	'gerics-remo2015'
	'ictp-regcm4-6'
	'ipsl-wrf381p'
	'knmi-racmo22e'
	'mohc-hadrem3-ga7-05'
	'mpi-csc-remo2009'
	'smhi-rca4'
	'uhoh-wrf361h'
)

# ###############################################################
# SECTION: ES-DOC SPECIALZATIONS
# ###############################################################

# Array of specifications.
export CORDEXP_SPECIALIZATIONS=(
	'toplevel'
	'atmos'
)
