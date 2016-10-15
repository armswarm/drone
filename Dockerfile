FROM armhf/alpine:latest
MAINTAINER armswarm

# metadata params
ARG PROJECT_NAME
ARG BUILD_DATE
ARG VCS_URL
ARG VCS_REF

# metadata
LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name=$PROJECT_NAME \
      org.label-schema.url=$VCS_URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vendor="armswarm" \
      org.label-schema.version="latest"

EXPOSE 8000

ENV DATABASE_DRIVER=sqlite3 \
    DATABASE_CONFIG=/var/lib/drone/drone.sqlite \
    GODEBUG=netdns=go

RUN apk add --no-cache ca-certificates

ADD drone /drone

ENTRYPOINT ["/drone"]
CMD ["server"]
