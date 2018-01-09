#!/bin/sh

for f in $(ls /etc/nginx/templates/*.template)
do
  base=$(basename $f)
  conf=${base%.*}

  echo "Writing conf: ${conf}"
  envsubst '${RELEASE_PING_APP_ENV_DOCKERCLOUD_SERVICE_HOSTNAMER1},${RELEASE_PING_APP_ENV_PORT}' < ${f} > /etc/nginx/sites-enabled/${conf}
  cat /etc/nginx/sites-enabled/${conf}
done

echo "Starting nginx"

"$@"
