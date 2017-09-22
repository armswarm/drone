FROM quay.io/armswarm/alpine:3.6

EXPOSE 8000 9000 80 443

ENV DATABASE_DRIVER=sqlite3 \
    DATABASE_CONFIG=/var/lib/drone/drone.sqlite \
    GODEBUG=netdns=go \
    XDG_CACHE_HOME=/var/lib/drone

RUN apk add --no-cache ca-certificates

ADD drone-server /bin/

ENTRYPOINT ["/bin/drone-server"]
