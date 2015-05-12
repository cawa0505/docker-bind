FROM jimmyyen/ubuntu:latest
MAINTAINER zeng.tw@gmail.com

RUN rm -rf /etc/apt/apt.conf.d/docker-gzip-indexes \
 && apt-get update \
 && apt-get install -y bind9 perl libnet-ssleay-perl openssl \
      libauthen-pam-perl libpam-runtime libio-pty-perl \
      apt-show-versions \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get clean

ADD start /start
RUN chmod 755 /start

EXPOSE 53/udp
VOLUME ["/data"]
CMD ["/start"]
