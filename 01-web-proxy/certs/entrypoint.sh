#!/bin/sh\nenvsubst ,, < /etc/nginx/conf.d/default.conf > /etc/nginx/conf.d/default.conf\nexec "$@"
