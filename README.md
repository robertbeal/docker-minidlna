[![Actions Status](https://github.com/robertbeal/docker-minidlna/workflows/build/badge.svg)](https://github.com/robertbeal/docker-minidlna/actions)
[![](https://images.microbadger.com/badges/image/robertbeal/minidlna.svg)](https://microbadger.com/images/robertbeal/minidlna "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/robertbeal/syncthing.svg)](https://microbadger.com/images/robertbeal/syncthing "Get your own version badge on microbadger.com")
[![](https://img.shields.io/docker/pulls/robertbeal/minidlna.svg)](https://hub.docker.com/r/robertbeal/minidlna/)
[![](https://img.shields.io/docker/stars/robertbeal/minidlna.svg)](https://hub.docker.com/r/robertbeal/minidlna/)

# minidlna

Container-ised multi-arch build of Minidlna using su-exec (for file permissions) that can be run in read-only mode.

```bash
docker run \
    --name=minidlna \
    --init \
    --user $(id minidlna -u):$(id minidlna -g) \
    --publish 8200:8200/tcp \
    --publish 1900:1900/udp \
    --net host \
    --read-only \
    --tmpfs /tmp:rw,size=10000k \
    --security-opt="no-new-privileges:true" \
    --volume /etc/localtime:/etc/localtime:ro \
    --volume /mnt/media:/media:ro \
    --health-cmd="nc -z 127.0.0.1 8200 || exit 1" \
    --health-interval=5s \
    --health-retries=3 \
    robertbeal/minidlna -f /media/config/minidlna.conf -S
```
