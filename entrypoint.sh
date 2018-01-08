#!/bin/sh

for f in $(ls /etc/nginx/templates/*.template)
do
  base=$(basename $f)
  conf=${base%.*}

  echo "Writing conf: ${conf}"
  envsubst < ${f} > /etc/nginx/sites-enabled/${conf}
  cat /etc/nginx/sites-enabled/${conf}
done

echo "Starting nginx"

"$@"
