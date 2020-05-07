#!/usr/bin/env bash

sed -i "s/ENVIRONMENT_NAME/${ENVIRONMENT_NAME:-unknown}/" /usr/share/nginx/html/app/index.html
nginx -g "daemon off;"