FROM alpine:3.16.1
LABEL maintainer="github.com/robertbeal"

RUN apk --no-cache add \
  inotify-tools \
  ffmpeg \
  flac \
  libvorbis \
  libexif \
  libjpeg \
  libid3tag \
  minidlna \
  su-exec \
  && rm -rf /tmp/* \
  && mkdir /config \
  && touch /config/minidlna.conf

VOLUME /config /data
EXPOSE 8200 1900/udp
HEALTHCHECK --interval=30s --timeout=3s \
  CMD nc -z 127.0.0.1 3000 || exit 1

COPY entrypoint.sh /usr/local/bin
ENTRYPOINT ["entrypoint.sh"]
CMD ["-f", "/config/minidlna.conf", "-S"]
