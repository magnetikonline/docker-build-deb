FROM ubuntu:16.04
MAINTAINER Peter Mescalchin <peter@magnetikonline.com>

ENV VERSION 7.1.3

RUN apt-get update && apt-get -y upgrade && \
	apt-get -y install checkinstall libcurl4-openssl-dev libjpeg62-dev libpng12-dev libxml2-dev && \
	apt-get clean

ADD http://php.net/get/php-$VERSION.tar.gz/from/this/mirror /root/build/php-$VERSION.tar.gz
WORKDIR /root/build
RUN tar -xf php-$VERSION.tar.gz

ADD ./resource/configure.sh /root/build/php-$VERSION/
WORKDIR /root/build/php-$VERSION
RUN chmod u+x configure.sh
RUN ./configure.sh && make

RUN echo "magnetikonline: PHP $VERSION" >description-pak && \
	checkinstall -Dy --install=no --nodoc make -i install

CMD ["/bin/bash"]
