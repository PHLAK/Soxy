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
    if [ ! -f soxy.pid ]; then
        # Establish SOCKS connection
        nohup ssh -qCD 1080 $REMOTE_USER@$REMOTE_HOST -p $REMOTE_PORT -N &
            
        # Write the PID to soxy.pid
        echo $(getPid) > soxy.pid
     else
        echo "Socks proxy already running"
    fi
}

function stopSocks {

    # Determine PID
    if [ -f soxy.pid ]; then
        PID=$(cat soxy.pid)
    else
        PID=$(getPid)
    fi
        
    # Kill the process
    kill $PID
    
    # Remove the PID file
    if [ -f soxy.pid ]; then
        rm -f soxy.pid
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
        cat nohup.out
    ;;
    *)
        echo "Usage: $0 { start | stop | restart }"
    ;;
esac