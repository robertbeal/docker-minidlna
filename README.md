[![](https://images.microbadger.com/badges/image/robertbeal/minidlna.svg)](https://microbadger.com/images/robertbeal/minidlna "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/robertbeal/minidlna.svg)](https://microbadger.com/images/robertbeal/minidlna "Get your own version badge on microbadger.com")
[![](https://img.shields.io/docker/pulls/robertbeal/minidlna.svg)](https://hub.docker.com/r/robertbeal/minidlna/)
[![](https://img.shields.io/docker/stars/robertbeal/minidlna.svg)](https://hub.docker.com/r/robertbeal/minidlna/)

# minidlna

Container-ised multi-arch builds of Minidlna, using tini (for init) and su-exec (for file permissions) that can be run in read-only mode.

```bash
docker run \
    --name=minidlna \
    --init \
    --user $(id minidlna -u):$(id minidlna -g) \
    --publish 8200:8200/tcp -p 1900:1900/udp \
    --net host \
    --read-only \
    --tmpfs /tmp:rw,size=10000k \
    --security-opt="no-new-privileges:true" \
    --volume /home/minidlna:/config:ro \
    --volume /media/storage/videos:/media/videos:ro \
    --volume /media/storage/music:/media/music:ro \
    --health-cmd="curl --fail http://localhost:8200 || exit 1" \
    --health-interval=5s \
    --health-retries=3 \
    robertbeal/minidlna -f /config/minidlna.conf -S
```
