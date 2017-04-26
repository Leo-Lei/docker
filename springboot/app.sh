#!/bin/bash
### BEGIN INIT INFO
#
# Provides:     location_server
# Required-Start:    $local_fs  $remote_fs
# Required-Stop:    $local_fs  $remote_fs
# Default-Start:     2 3 4 5
# Default-Stop:     0 1 6
# Short-Description:    initscript
# Description:     This file should be used to construct scripts to be placed in /etc/init.d.
#
### END INIT INFO

## Fill in name of program here.
SERVICE_NAME=app
EXEC_START="java -jar $JAVA_OPTS /opt/app.jar &"

function start() {
    pidlist=`ps -ef | grep '/opt/app.jar' |grep -v "grep"|awk '{print $2}'`
    if [ "$pidlist" = "" ]
        then
            echo "no old pid alive, start new service ......"
    else
        ## Program is running, so stop it
        echo "old pid exists: $pidlist. First stop old pids"
        # pid=`ps -ef | grep '/opt/app.jar' |grep -v "grep"|awk '{print $2}'`
        kill -9 $pidlist
        echo "$SERVICE_NAME stopped"
    fi
    echo $EXEC_START
    ## Change from /dev/null to something like /var/log/$PROG if you want to save output.
#     $EXEC_START 2>&1 >/var/log/$SERVICE_NAME &
#     pid=`ps -ef | grep '/opt/app.jar' |grep -v "grep"|awk '{print $2}'`
#     echo "$SERVICE_NAME started, pid is $pid"
}

function stop() {
    echo "begin stop"
    pidlist=`ps -ef | grep '/opt/app.jar' |grep -v "grep"|awk '{print $2}'`
    if [ "$pidlist" = "" ]
        then
            echo "no old pid alive, already stopped!"
    else
        ## Program is running, so stop it
        echo "old pid exists: $pidlist"
        kill -9 $pidlist
        echo "$SERVICE_NAME stopped"
    fi
}

# ## Check to see if we are running as root first.
# ## Found at http://www.cyberciti.biz/tips/shell-root-user-check-script.html
# if [ "$(id -u)" != "0" ]; then
#     echo "This script must be run as root" 1>&2
#     exit 1
# fi

case "$1" in
    start)
        start
        exit 0
    ;;
    stop)
        stop
        exit 0
    ;;
    reload|restart|force-reload)
        stop
        start
        exit 0
    ;;
    **)
        echo "Usage: $0 {start|stop|reload}" 1>&2
        exit 1
    ;;
esac
