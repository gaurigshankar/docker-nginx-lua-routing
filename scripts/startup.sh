#!/bin/bash
/usr/sbin/crond
crontab /etc/cron.d/per_minute_nginx_reload
/usr/local/openresty/bin/openresty -g "daemon off;"