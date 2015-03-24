FROM ubuntu:14.04.2
MAINTAINER Peter Mescalchin "peter@magnetikonline.com"

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install checkinstall libcurl4-openssl-dev libjpeg62-dev libpng12-dev libxml2-dev
RUN apt-get clean

ADD http://php.net/get/php-5.6.7.tar.gz/from/this/mirror /root/build/php-5.6.7.tar.gz
WORKDIR /root/build
RUN tar -xf php-5.6.7.tar.gz

ADD ./resource/configure.sh /root/build/php-5.6.7/
WORKDIR /root/build/php-5.6.7
RUN chmod a+x configure.sh
RUN ./configure.sh && make
RUN echo "magnetikonline: PHP 5.6.7" > description-pak && checkinstall -Dy --install=no --nodoc make -i install

CMD ["/bin/bash"]
