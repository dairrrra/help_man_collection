#!/bin/bash
set -eu

function initSetup() {
    echo "start Setup"
    
    echo "apt-get update"
    sudo apt-get update
    echo "apt-get upgrade"
    sudo apt-get upgrade
    echo "install vim"
    sudo apt-get install vim
    echo "install git"
    sudo apt-get install git
    echo "fin"
}
function installNode() {
    echo "start Start"
    echo "Do you want to install nodebrew??[y/n]"
    read brew
    if [ ${brew} = "y" ]
    then
        echo "ok! nodebrew install!!"
            curl -L git.io/nodebrew | perl - setup
        echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> ~/.bash_profile
        # export PATH=$HOME/.nodebrew/current/bin:$PATH
        wait
        source ~/.bashrc
        nodebrew help
        echo "Did you see nodebrew help?(No Error?)?[y/n]" 
        read ans
        if [ ${ans} = "y" ]
        then
            echo "ok! Proceed!!\n"
        else
            echo "stop"
            exit 1
        fi
    fi
    nodebrew ls-all
    echo "What version do you want to install?(ex:v6.4.0/latest)"
    read version
    nodebrew install-binary $version
    nodebrew use $version
    echo "Node currently in use"
    node -v
    echo "fin"
}
function func() {
    echo "start Setup" 
    echo "fin"
}

function main() {
    while :
    do
        echo "Select Ubuntu setup?"
        echo "1 ) init setup" 
        echo "2 ) node install" 
        echo "3 ) "
        read -p: setup 
        case "$setup" in
        1 ) 
            initSetup ;;
        2 ) 
            installNode ;;
        3 ) 
            func ;;
        * ) break ;;
        esac
    done
    exit 0
}

main