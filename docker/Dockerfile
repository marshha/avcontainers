FROM alpine:latest
COPY patches /root/patches
COPY tests /root/tests
RUN apk add --update alpine-sdk libressl libressl-dev linux-headers bsd-compat-headers pcre pcre-dev libxml2 libxml2-dev curl curl-dev json-c json-c-dev
RUN cd /root/ && wget https://www.clamav.net/downloads/production/clamav-0.101.0.tar.gz && tar xvf clamav-0.101.0.tar.gz && cd clamav-0.101.0/ && ./configure && patch -p0 < /root/patches/fts.patch && patch -p0 < /root/patches/fts_namlen.patch && make && make install
COPY config/freshclam.conf /usr/local/etc/freshclam.conf
RUN adduser -S clamav && mkdir -p /usr/local/share/clamav && chown -R clamav /usr/local/share/clamav/
RUN freshclam --verbose
RUN chmod +x /root/tests/*.sh
ENTRYPOINT ["/bin/sh"]
