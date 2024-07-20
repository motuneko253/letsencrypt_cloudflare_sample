FROM debian:unstable-slim

ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo

RUN apt update && apt -y upgrade
RUN apt -y install nano certbot python3-certbot-dns-cloudflare tzdata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

COPY ./bin/certbot_install.sh /root/certbot_install.sh
RUN chmod 755 /root/certbot_install.sh

WORKDIR /etc/letsencrypt
CMD ["sleep", "infinity"]
