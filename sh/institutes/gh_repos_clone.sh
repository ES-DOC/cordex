#!/bin/bash

function _do_clone_repo()
{
    echo "123"
}

function _do_clone_repos_inst()
{
    if [ ! -d $CORDEX_PATH_REPOS_INST ]; then
        mkdir $CORDEX_PATH_REPOS_INST
    fi

}

function _do_clone_repos_util()
{
    if [ ! -d $CORDEX_PATH_REPOS_UTIL ]; then
        mkdir $CORDEX_PATH_REPOS_UTIL
    fi
    
}

function _do_clone_repos_spec()
{
    if [ ! -d $CORDEX_PATH_REPOS_SPEC ]; then
        mkdir $CORDEX_PATH_REPOS_SPEC
    fi

    for repo in "${REPOS_SPEC[@]}"
    do
        if [ ! -d $CORDEX_PATH_REPOS_SPEC/$repo ]; then
            log "GH : cloning repo: "$institute
            pushd $CORDEX_PATH_REPOS_SPEC
            git clone https://github.com/ES-DOC/$repo.git > /dev/null
            popd
        else
            log "GH : pulling repo: "$repo
            pushd $CORDEX_PATH_REPOS_SPEC/$repo
            git pull > /dev/null
            popd
        fi
    done
}

# Main entry point.
main()
{
    _do_clone_repos_inst
    _do_clone_repos_spec
    _do_clone_repos_util

    # if [ ! -d $CORDEX_PATH_REPOS_INST ]; then
    #     mkdir $CORDEX_PATH_REPOS_INST
    # fi

    # pushd $CORDEX_PATH_REPOS_INST
    # for institute in "${INSTITUTE[@]}"
    # do
    #     if [ ! -d $CORDEX_PATH_REPOS_INST/$institute ]; then
    #         log "GH : cloning repo: "$institute
    #         git clone https://github.com/ES-DOC-INSTITUTIONAL/$institute.git > /dev/null
    #     else
    #         log "GH : pulling repo: "$institute
    #         pushd $CORDEX_PATH_REPOS_INST/$institute
    #         git pull > /dev/null
    #         popd -1
    #     fi
    # done
    # popd -1
}

# Import utils.
source $CORDEX_PATH_SH/utils.sh

# Invoke entry point.
main
