#!/bin/bash

## SET THESE VARIABLES
########################################

REMOTE_USER='USER'
REMOTE_HOST='HOSTNAME'
REMOTE_PORT='22'

LOCAL_PORT='1080'

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
        nohup ssh -qCD 1080 $REMOTE_USER@$REMOTE_HOST -p $REMOTE_PORT -N &
            
        # Create the lock file
        touch $LOCK_FILE
        
        # Echo status message to console
        echo "DONE!"
    else
        echo "Socks proxy already running, try restarting"
    fi
}

function stopSocks {
    # Echo status message to console
    echo -n "Stopping SOCKS proxy ... "
        
    # Kill the process
    kill $(getPid)
    
    # Remove the PID file
    if [ -f $LOCK_FILE ]; then
        rm -f $LOCK_FILE
    fi
    
    # Echo status message to console
    echo "DONE!"
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