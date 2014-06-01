FROM ubuntu:14.04
MAINTAINER Peter Mescalchin "peter@magnetikonline.com"

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install checkinstall libxml2-dev libcurl4-openssl-dev libjpeg62-dev libpng12-dev

RUN mkdir /root/build
ADD http://php.net/get/php-5.5.13.tar.gz/from/this/mirror /root/build/php-5.5.13.tar.gz
WORKDIR /root/build
RUN tar xf php-5.5.13.tar.gz

ADD ./resource/configure.sh /root/build/php-5.5.13/
WORKDIR /root/build/php-5.5.13
RUN chmod a+x configure.sh
RUN ./configure.sh && make
RUN echo "PHP 5.5.13" > description-pak && checkinstall -Dy --install=no --nodoc make -i install

CMD ['/bin/bash']
