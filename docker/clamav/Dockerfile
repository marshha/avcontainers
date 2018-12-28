FROM alpine:3.7
COPY patches /root/patches
RUN apk add --update alpine-sdk && apk add --update openssl && apk add --update openssl-dev && apk add --update linux-headers && apk add --update bsd-compat-headers
RUN cd /root/ && wget https://www.clamav.net/downloads/production/clamav-0.101.0.tar.gz && tar xvf clamav-0.101.0.tar.gz && cd clamav-0.101.0/ && ./configure && patch -p0 < /root/patches/fts.patch && patch -p0 < /root/patches/fts_namlen.patch && make && make install
COPY config/freshclam.conf /usr/local/etc/freshclam.conf
RUN adduser -S clamav && mkdir -p /usr/local/share/clamav && chown -R clamav /usr/local/share/clamav/
RUN freshclam --verbose
ENTRYPOINT ["/bin/sh"]
