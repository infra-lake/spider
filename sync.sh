#!/bin/bash

nginx -g "daemon off;" &

echo "SYNC_TIME: ${SYNC_TIME}"
echo "BUCKET_NAME: ${BUCKET_NAME}"

while true; do
    rclone --config="/opt/app/rclone.conf" sync --create-empty-src-dirs --gcs-decompress remote:${BUCKET_NAME}/ /usr/share/nginx/html/
    echo "checking updates at ${BUCKET_NAME}..."
    sleep ${SYNC_TIME}
done
