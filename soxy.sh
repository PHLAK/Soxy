#!/bin/bash

## SET THESE VARIABLES
########################################

REMOTE_USER='root'
REMOTE_HOST='carbon.bocksystems.com'
REMOTE_PORT='443'
LOCAL_PORT='8080'

## SCRIPT VARS, DON'T MODIFY
########################################

LOCK_FILE=/tmp/soxy.lock

## FUNCTIONS
########################################

function getPid {
    # Get the PID
    PID=$(ps ax | grep ssh | grep $LOCAL_PORT | awk '{ print $1 }')
    
    # Return the PID
    echo $PID
}

function startSocks {
    # Echo status message to console
    echo -n "Starting SOCKS proxy on port ${LOCAL_PORT} ... "
        
    if [ ! -f $LOCK_FILE ]; then
        # Establish SOCKS connection
        ssh -qfCD 8080 $REMOTE_USER@$REMOTE_HOST -p $REMOTE_PORT -N & > /dev/null 2>&1
            
        # Create the lock file
        touch $LOCK_FILE

    else
        echo "Socks proxy already running, try restarting"
    fi

    # Echo status message to console
    echo "Proxy started"
}

function stopSocks {
    # Echo status message to console
    echo -n "Stopping SOCKS proxy ... "
        
    # Kill the process
    kill $(getPid) > /dev/null 2>&1
    
    # Remove the PID file
    if [ -f $LOCK_FILE ]; then
        rm -f $LOCK_FILE
    fi
    
    # Echo status message to console
    echo "Proxy stopped"
}


## SWITCHES
########################################

case $1 in
    'start')
        startSocks
    ;;
    'stop')
        stopSocks
    ;;
    'restart')
        stopSocks
        startSocks
    ;;
    'status')
        if [ $(getPid) ]; then
            echo "SOCKS proxy running on port ${LOCAL_PORT} -- PID: $(getPid)"
        else 
            echo "SOCKS proxy not currently running"
        fi
    ;;
    *)
        echo "Usage: $0 { start | stop | restart | status }"
    ;;
esac
