#!/bin/sh
set -e
/usr/local/bin/initialize.sh || exit 1
#fix link-count, as cron is being a pain, and docker is making hardlink count >0 (very high)
touch /etc/crontab /etc/cron.*/*
nginx -g "daemon off;" || exit 1
echo "starting nginx web server..."

exec "$@"

