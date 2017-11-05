FROM ubuntu:16.04
MAINTAINER Peter Mescalchin <peter@magnetikonline.com>

ENV VERSION 1.12.0

RUN apt-get update && apt-get -y upgrade && \
	apt-get -y install checkinstall libpcre3-dev zlib1g-dev && \
	apt-get clean

ADD http://nginx.org/download/nginx-$VERSION.tar.gz /root/build/
WORKDIR /root/build
RUN tar -xf nginx-$VERSION.tar.gz

ADD ./resource/configure.sh /root/build/nginx-$VERSION/
WORKDIR /root/build/nginx-$VERSION
RUN chmod u+x configure.sh
RUN ./configure.sh && make

RUN echo "magnetikonline: Nginx" >description-pak && \
	checkinstall -Dy --install=no --nodoc --pkgname=nginx --pkgversion=$VERSION \
		make -i install

CMD ["/bin/bash"]
