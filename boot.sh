#!/bin/bash

set -eux

if [ -z "${HTTPS:-}" ]; then
  exec gunicorn httpbin:app -b 0.0.0.0:80
else
  openssl req -batch -new -x509 -newkey rsa:2048 -nodes -sha256 \
    -subj "/CN=httpbin.ngyuki.jp/O=ngyuki" \
    -days "3650" \
    -keyout "/root/server.key" \
    -out "/root/server.crt"
  exec gunicorn httpbin:app \
    -b "0.0.0.0:443" \
    --keyfile "/root/server.key" \
    --certfile "/root/server.crt"
fi
