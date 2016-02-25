#!/bin/bash
#
# validate_srv.py        Startup script for the saml schematron validation service
# chkconfig: 345 84 16
# description: validate_srv.py SAML schematron service
#
### BEGIN INIT INFO
# Provides: pyff
# Required-Start: $local_fs $remote_fs $network $named
# Required-Stop: $local_fs $remote_fs $network
# Short-Description: start and stop pyff SAML md aggregator
# Description: The Apache HTTP Server is an extensible server
#  implementing the current HTTP standards.
### END INIT INFO

# Path definitions
prog='validate_srv.py'
PIDFILE=/var/run/saml_schematron.pid
RETVAL=0

start() {
        echo -n $"Starting $prog: "
        source /var/virtualenv/saml_schematron/bin/activate && \
        /usr/local/sbin/daemonize \
            -c /usr/local/saml_schematron/webapp/ \
            -e /var/log/saml_schematron/error.log \
            -E PYTHONPATH=/var/virtualenv/saml_schematron/lib/python2.6/site-packages/ \
            -o /var/log/saml_schematron/access.log \
            -p $PIDFILE \
            /usr/local/saml_schematron/webapp/validate_srv.py
        echo
}

stop() {
        echo -n $"Stopping $prog: "
        if [ -f $PIDFILE ]; then
        kill `cat $PIDFILE`
    else
        echo "pid file $PIDFiLE not found"
    fi
        RETVAL=$?
        echo
        [ $RETVAL = 0 ] && rm -f ${PIDFILE}
}
# See how we were called.
case "$1" in
  start)
        start
        ;;
  stop)
        stop
        ;;
  status)
        if [ -f $PIDFILE ]; then
        status -p ${PIDFILE} $PYFFDEXEC
    else
        echo "Process id file not found: ${PIDFILE}"
    fi
        RETVAL=$?
        ;;
  restart)
        stop
        start
        ;;
  *)
        echo $"Usage: $prog {start|stop|restart|status|help}"
        RETVAL=2
esac

exit $RETVAL
