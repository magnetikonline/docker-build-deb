FROM ubuntu:16.04
MAINTAINER Peter Mescalchin <peter@magnetikonline.com>

RUN apt-get update && apt-get -y upgrade && \
	apt-get -y install checkinstall libpcre3-dev zlib1g-dev && \
	apt-get clean

ADD http://nginx.org/download/nginx-1.10.1.tar.gz /root/build/
WORKDIR /root/build
RUN tar -xf nginx-1.10.1.tar.gz

ADD ./resource/configure.sh /root/build/nginx-1.10.1/
WORKDIR /root/build/nginx-1.10.1
RUN chmod u+x configure.sh
RUN ./configure.sh && make
RUN echo "magnetikonline: Nginx 1.10.1" > description-pak && \
	checkinstall -Dy --install=no --nodoc make -i install

CMD ["/bin/bash"]
