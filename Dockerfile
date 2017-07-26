FROM 1and1internet/ubuntu-16
MAINTAINER brian.wojtczak@1and1.co.uk
ARG DEBIAN_FRONTEND=noninteractive
COPY files/ /
RUN echo "test2" > /test.txt && chown 100000 /test.txt
RUN echo "test\nmore test\nanother line" > /test2.txt && chown 100000 /test2.txt
RUN echo "test\nmore test\nanother line" > /test3.txt && chown 100000 /test3.txt
