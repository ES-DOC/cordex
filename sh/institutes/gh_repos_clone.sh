#!/usr/bin/env bash

function _do_clone_repo()
{
    echo "123"
}

function _do_clone_repos_inst()
{
    if [ ! -d "$CORDEX_HOME"/repos/institutions ]; then
        mkdir "$CORDEX_HOME"/repos/institutions
    fi

}

function _do_clone_repos_util()
{
    if [ ! -d $CORDEX_HOME/repos/libs ]; then
        mkdir $CORDEX_HOME/repos/libs
    fi
    
}

function _do_clone_repos_spec()
{
    if [ ! -d "$CORDEX_HOME"/repos/specializations ]; then
        mkdir "$CORDEX_HOME"/repos/specializations
    fi

    for repo in "${CORDEX_REPOS_SPEC[@]}"
    do
        if [ ! -d "$CORDEX_HOME"/repos/specializations/$repo ]; then
            log "GH : cloning repo: "$institute
            pushd "$CORDEX_HOME"/repos/specializations
            git clone https://github.com/ES-DOC/$repo.git > /dev/null
            popd
        else
            log "GH : pulling repo: "$repo
            pushd "$CORDEX_HOME"/repos/specializations/$repo
            git pull > /dev/null
            popd
        fi
    done
}

# Main entry point.
function main()
{
    _do_clone_repos_inst
    _do_clone_repos_spec
    _do_clone_repos_util

    # if [ ! -d "$CORDEX_HOME"/repos/institutions ]; then
    #     mkdir "$CORDEX_HOME"/repos/institutions
    # fi

    # pushd "$CORDEX_HOME"/repos/institutions
    # for institute in "${CORDEX_INSTITUTE[@]}"
    # do
    #     if [ ! -d "$CORDEX_HOME"/repos/institutions/$institute ]; then
    #         log "GH : cloning repo: "$institute
    #         git clone https://github.com/ES-DOC-INSTITUTIONAL/$institute.git > /dev/null
    #     else
    #         log "GH : pulling repo: "$institute
    #         pushd "$CORDEX_HOME"/repos/institutions/$institute
    #         git pull > /dev/null
    #         popd 1
    #     fi
    # done
    # popd 1
}

# Invoke entry point.
main
