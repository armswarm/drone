FROM quay.io/armswarm/alpine:3.5

EXPOSE 8000

ENV DATABASE_DRIVER=sqlite3 \
    DATABASE_CONFIG=/var/lib/drone/drone.sqlite \
    GODEBUG=netdns=go \
    XDG_CACHE_HOME=/var/lib/drone

RUN apk add --no-cache ca-certificates

ADD drone /drone

ENTRYPOINT [ "/drone" ]
CMD [ "server" ]
