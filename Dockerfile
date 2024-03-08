FROM ubuntu:20.04
LABEL maintainer="bncfbb <bncfbb@163.com>"
ARG TZ=Asia/Shanghai
ARG DEBIAN_FRONTEND="noninteractive"
ENV USERNAME=admin
ENV PASSWORD=admin
ENV PORT=80
RUN apt-get update \
    && apt-get update && apt-get install curl jq net-tools iproute2 open-vm-tools tzdata -y \
    && rm -rf /var/lib/apt/lists/* \
    && echo "${TZ}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime
COPY shutdown.sh /sbin/shutdown
ENTRYPOINT ["/usr/bin/vmtoolsd"]
