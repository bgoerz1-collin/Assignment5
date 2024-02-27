FROM alpine as builder
RUN apk upgrade --no-cache
WORKDIR /
COPY data.txt /

FROM fedora as final
RUN dnf -yqq upgrade 
WORKDIR /
COPY --from=builder /data.txt /data.txt
