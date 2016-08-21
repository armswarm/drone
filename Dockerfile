FROM armhf/alpine:latest

LABEL repository="https://github.com/armswarm/drone"

EXPOSE 8000

ENV DATABASE_DRIVER=sqlite3 \
    DATABASE_CONFIG=/var/lib/drone/drone.sqlite \
    GODEBUG=netdns=go

RUN apk add --no-cache ca-certificates

ADD drone /drone

ENTRYPOINT ["/drone"]
CMD ["server"]
