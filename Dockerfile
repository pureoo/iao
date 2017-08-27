FROM alpine

RUN if [ $(wget -qO- ipinfo.io/country) == CN ]; then echo "http://mirrors.ustc.edu.cn/alpine/v3.4/main/" > /etc/apk/repositories ;fi  \
    &&  apk update \
    && apk add --no-cache libsodium py2-pip \
    && pip --no-cache-dir install https://github.com/shadowsocks/shadowsocks/archive/master.zip
#ADD config.json /config.json
#EXPOSE your_port	
ENTRYPOINT ["/usr/bin/ssserver"]
