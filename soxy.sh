#!/bin/bash

## SET THESE VARIABLES
########################################

REMOTE_USER='USER'
REMOTE_HOST='HOSTNAME'
REMOTE_PORT='22'

LOCAL_PORT='1080'


## FUNCTIONS
########################################

function getPid {
    # Get the PID
    PID=$(ps ax | grep ssh | grep $LOCAL_PORT | awk '{ print $1 }')
    
    # Return the PID
    echo $PID
}

function startSocks {
    if [ ! -f soxy.lock ]; then
        # Establish SOCKS connection
        nohup ssh -qCD 1080 $REMOTE_USER@$REMOTE_HOST -p $REMOTE_PORT -N &
            
        # Create the lock file
        touch soxy.lock
    else
        echo "Socks proxy already running, try running $0 restart"
    fi
}

function stopSocks {
    # Kill the process
    kill $(getPid)
    
    # Remove the PID file
    if [ -f soxy.lock ]; then
        rm -f soxy.lock
    fi
}


## SWITCHES
########################################

case $1 in
    'start')
        # Echo status message to console
        echo -n "Starting SOCKS proxy on port ${LOCAL_PORT} ... "
        
        startSocks
        
        # Echo status message to console
        echo "DONE!"
    ;;
    'stop')
        # Echo status message to console
        echo -n "Stopping SOCKS proxy ... "
    
        stopSocks
        
        # Echo status message to console
        echo "DONE!"
    ;;
    'restart')
        # Echo status message to console
        echo -n "Restarting SOCKS proxy ... "
        
        stopSocks
        startSocks
        
        # Echo status message to console
        echo "DONE!"
    ;;
    'status')
        if [ $(getPid) ]; then
            echo "SOCKS proxy running on port ${LOCAL_PORT}"
        else 
            echo "SOCKS proxy not currently running"
        fi
    ;;
    *)
        echo "Usage: $0 { start | stop | restart | status }"
    ;;
esac
