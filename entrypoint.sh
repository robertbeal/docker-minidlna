#!/bin/sh
set -e

if [ "$1" = '/usr/sbin/minidlnad' -a "$(id -u)" = '0' ]; then
  chown -R minidlnad /config
  exec su-exec minidlna /usr/sbin/minidlnad -P /tmp/minidlna.pid "$@"
fi

exec /usr/sbin/minidlnad -P /tmp/minidlna.pid "$@"
