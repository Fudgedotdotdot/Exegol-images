#!/bin/bash
# Author: Fudgedotdotdot

source common.sh

function install_custom() {
    colorecho "Installing tmuxinator"
    rvm use 3.1.2@tmuxinator --create
    gem install tmuxinator
    rvm use 3.2.2@default
    add-aliases tmuxinator
    add-history tmuxinator
    add-test-command "tmuxinator version"
    add-to-list "tmuxinator,https://github.com/tmuxinator/tmuxinator,Create and manage tmux sessions easily"
}

function package_custom() {
    set_env
    local start_time
    local end_time
    start_time=$(date +%s)
    install_custom
    post_install
    end_time=$(date +%s)
    local elapsed_time=$((end_time - start_time))
    colorecho "Package custom completed in $elapsed_time seconds."
}
