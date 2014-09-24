FROM dockerphp/baseimage
MAINTAINER Peter Mescalchin "peter@magnetikonline.com"

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install checkinstall libxml2-dev libcurl4-openssl-dev libjpeg62-dev libpng12-dev libmysqlclient-dev libsybdb5 freetds-dev zlib1g-dev libbz2-dev 
RUN apt-get clean

RUN ln -s /usr/lib/x86_64-linux-gnu/libsybdb.so /usr/lib/
RUN mkdir /root/build
#ADD http://php.net/get/php-5.6.0.tar.gz/from/this/mirror /root/build/php-5.6.0.tar.gz
COPY ./resource/php-5.6.0.tar.gz /root/build/php-5.6.0.tar.gz
WORKDIR /root/build
RUN tar xf php-5.6.0.tar.gz

ADD ./resource/configure.sh /root/build/php-5.6.0/
WORKDIR /root/build/php-5.6.0
RUN chmod a+x configure.sh
RUN ./configure.sh && make
RUN echo "magnetikonline: PHP 5.6.0" > description-pak && checkinstall -Dy --install=no --nodoc make -i install

CMD ["/bin/bash"]
