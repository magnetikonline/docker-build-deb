FROM ubuntu:16.04
MAINTAINER Peter Mescalchin <peter@magnetikonline.com>

RUN apt-get update && apt-get -y upgrade && \
	apt-get -y install checkinstall libcurl4-openssl-dev libjpeg62-dev libpng12-dev libxml2-dev && \
	apt-get clean

ADD http://php.net/get/php-7.0.8.tar.gz/from/this/mirror /root/build/php-7.0.8.tar.gz
WORKDIR /root/build
RUN tar -xf php-7.0.8.tar.gz

ADD ./resource/configure.sh /root/build/php-7.0.8/
WORKDIR /root/build/php-7.0.8
RUN chmod u+x configure.sh
RUN ./configure.sh && make
RUN echo "magnetikonline: PHP 7.0.8" > description-pak && \
	checkinstall -Dy --install=no --nodoc make -i install

CMD ["/bin/bash"]
