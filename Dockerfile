FROM alpine:edge

ENV BASICAUTH_USER=admin
ENV BASICAUTH_PWD=pwd123

ENV ARIANG_VER=0.4.0

RUN apk update && \
	apk add --no-cache --update bash curl && \
	mkdir -p /conf && \
	mkdir -p /conf-copy && \
	mkdir -p /data && \
	apk add --no-cache --update aria2 && \
	apk add unzip && \
	curl -LJO https://github.com/mayswind/AriaNg/releases/download/$ARIANG_VER/aria-ng-$ARIANG_VER.zip && \
	unzip aria-ng-$ARIANG_VER.zip -d /aria2-webui && \
    rm aria-ng-$ARIANG_VER.zip && \
    apk del unzip && \
	curl https://getcaddy.com | bash -s personal http.filemanager

ADD files/start.sh /conf-copy/start.sh
ADD files/aria2.conf /conf-copy/aria2.conf
ADD files/on-complete.sh /conf-copy/on-complete.sh
ADD files/Caddyfile /etc/Caddyfile

RUN chmod +x /conf-copy/start.sh

VOLUME ["/data"]
EXPOSE 6800
EXPOSE 10086

CMD ["/conf-copy/start.sh"]
