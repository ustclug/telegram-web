FROM gaoyifan/webogram

MAINTAINER Yifan Gao <docker@yfgao.com>

ARG name=telegram-proxy
ADD . /opt/smartentry/$name
ENV ASSETS_DIR=/opt/smartentry/$name

RUN smartentry.sh build

CMD ["run"]
