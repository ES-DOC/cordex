#!/usr/bin/env bash

# Main entry point.
function main()
{
    log "setting repos:"
    mkdir -p "$CORDEX_HOME"/repos
    _set_archives
    _set_institutions
    _set_libs
    _set_specializations
}

function _set_archives()
{
    local ARCHIVE

    log "... archives:"
	for ARCHIVE in "${CORDEX_ARCHIVES[@]}"
	do
        _set_repo "archives" "$ARCHIVE" https://github.com/ES-DOC/"$ARCHIVE".git
	done

    if [ ! -d "$CORDEX_HOME/repos/archives/esdoc-archive/esdoc" ]; then
        log "... ... uncompressing"
        pushd "$CORDEX_HOME/repos/archives/esdoc-archive" || exit
        cat docs_* | tar xz
        popd || exit
    fi
}

function _set_institutions()
{
    local INSTITUTION

    log "... institutions:"
	for INSTITUTION in "${CORDEXP_INSTITUTION_ID[@]}"
	do     
        _set_repo "institutions" "$INSTITUTION" https://github.com/ES-DOC-INSTITUTIONAL/"$INSTITUTION".git
	done  
}

function _set_libs()
{
    local LIB

    log "... libs:"
	for LIB in "${CORDEX_LIBS[@]}"
	do      
        _set_repo "libs" "$LIB" https://github.com/ES-DOC/"$LIB".git
	done      
}

function _set_specializations()
{
    local SPECIALIZATION

    log "... specializations:"
	for SPECIALIZATION in "${CORDEXP_SPECIALIZATIONS[@]}"
	do     
        _set_repo "specializations" "$SPECIALIZATION" "https://github.com/ES-DOC/cordex-specializations-$SPECIALIZATION.git"
	done 
}

function _set_repo()
{
    local REPO_TYPE=${1}
    local REPO_NAME=${2}
    local REPO_URL=${3}

    local PATH_TO_REPO_TYPE="$CORDEX_HOME/repos/$REPO_TYPE"
    local PATH_TO_REPO="$PATH_TO_REPO_TYPE/$REPO_NAME"

    mkdir -p "$PATH_TO_REPO_TYPE"

    if [ -d "$PATH_TO_REPO" ]; then
        log "... ... syncing $REPO_URL"
        pushd "$PATH_TO_REPO" || exit
        git pull > /dev/null 2>&1
        popd || exit
    else
        log "... ... cloning $REPO_URL"
        pushd "$PATH_TO_REPO_TYPE" || exit
        git clone "$REPO_URL" "$REPO_NAME" > /dev/null 2>&1
        popd || exit
    fi
}

# Invoke entry point.
main
