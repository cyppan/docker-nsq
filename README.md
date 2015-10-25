## Why another nsq image?

I personally use this image to build nsq producers located in the same container as the nsqd instance (http://nsq.io/deployment/topology_patterns.html#distributed-systems).    
S6 is used as the supervisor (http://skarnet.org/software/s6/index.html) based on the @just-containers S6 overlay Alpine image (https://hub.docker.com/r/justcontainers/base-alpine/).    
More info there: https://github.com/just-containers/s6-overlay

## How to use it?

The same way you use the official nsq image
```
docker run cyppan/nsq /<command>
```
`<command>` being one of 
* nsqd
* nsqlookupd
* nsqadmin
* nsq_to_nsq
* nsq_to_http
* nsq_to_file
* nsq_tail
* nsq_stat
* nsq_pubsub

## Producer app + nsqd mode

S6 allows you to manage this properly    
Dockerfile example:
```
FROM cyppan/nsq
RUN echo "#!/usr/bin/execlineb -P \n /nsqd" > /etc/services.d/nsqd/run
ADD producer.py /
CMD python producer.py
```
