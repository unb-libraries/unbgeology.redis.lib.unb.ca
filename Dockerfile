FROM redis:7-alpine

ENV REDIS_CONF_FILE="/usr/local/etc/redis/redis.conf"
ENV REDIS_MAX_MEMORY="8000000000"

COPY ./build /build
RUN mv /build/scripts /scripts && \
  mkdir -p /usr/local/etc/redis && \
  mv /build/conf/redis.conf "$REDIS_CONF_FILE"

ENTRYPOINT /scripts/run.sh

LABEL ca.unb.lib.generator="redis" \
  org.opencontainers.image.authors="UNB Libraries <libsupport@unb.ca>" \
  org.opencontainers.image.created="$BUILD_DATE" \
  org.opencontainers.image.description="unbgeology.redis.lib.unb.ca is the redis application serving unbgeology instances at UNB Libraries." \
  org.opencontainers.image.revision="$VCS_REF" \
  org.opencontainers.image.source="https://github.com/unb-libraries/unbgeology.redis.lib.unb.ca" \
  org.opencontainers.image.title="unbgeology.redis.lib.unb.ca" \
  org.opencontainers.image.vendor="University of New Brunswick Libraries" \
  org.opencontainers.image.version="$VERSION"
