#!bin/sh
set -e
rm -f /opt/revention/tmp/pids/server.pid
exec "$@"
