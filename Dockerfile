FROM node as builder
ENV WEBOGRAM_SRC=/usr/local/src/webogram \
    WEBOGRAM_VERSION=0.5.7
RUN apt-get update
RUN apt-get install -qyy git build-essential zip
RUN mkdir -p $WEBOGRAM_SRC
RUN git clone -b v$WEBOGRAM_VERSION https://github.com/zhukov/webogram.git $WEBOGRAM_SRC
WORKDIR $WEBOGRAM_SRC
RUN npm install -g -q gulp
RUN npm install -q
RUN version=$WEBOGRAM_VERSION make

FROM smartentry/alpine:3.6-0.4.0
COPY --from=builder /usr/local/src/webogram/dist_package /opt/webogram
ADD .docker $ASSETS_DIR
RUN smartentry.sh build
CMD ["nginx"]
