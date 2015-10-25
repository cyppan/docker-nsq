FROM justcontainers/base-alpine

ENV NSQ_VERSION 0.3.6
ENV GO_VERSION  1.5.1

ADD https://github.com/nsqio/nsq/releases/download/v$NSQ_VERSION/nsq-$NSQ_VERSION.linux-amd64.go$GO_VERSION.tar.gz /tmp/nsq.tar.gz

RUN gunzip /tmp/nsq.tar.gz && tar -C / -xf /tmp/nsq.tar && mv /nsq*/bin/* /

