FROM alpine:edge as alpine
RUN apk add -u ca-certificates tzdata && \
    adduser -H -D user

FROM scratch AS release
COPY --from=alpine /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=alpine /usr/share/zoneinfo /usr/share/zoneinfo
COPY --from=alpine /etc/passwd /etc/passwd
USER user
ENTRYPOINT ["/app"]
ONBUILD COPY bin/* /app
