FROM alpine as builder
RUN apk upgrade --no-cache
WORKDIR /opt/webapp
COPY data.txt /opt/webapp

FROM fedora as final
RUN dnf -yqq upgrade 
WORKDIR /opt/webapp
COPY --from=builder /opt/webapp/data.txt /opt/webapp/data.txt
