FROM ubuntu:14.04
MAINTAINER Peter Mescalchin "peter@magnetikonline.com"

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install checkinstall autoconf make
RUN apt-get clean

RUN mkdir /root/build
ADD http://xdebug.org/files/xdebug-2.2.5.tgz /root/build/xdebug-2.2.5.tgz
WORKDIR /root/build
RUN tar xf xdebug-2.2.5.tgz

ADD ./php_5.6.0-1_amd64.deb /root/
RUN dpkg -i /root/php_5.6.0-1_amd64.deb
WORKDIR /root/build/xdebug-2.2.5
RUN /usr/local/bin/phpize
RUN ./configure --enable-xdebug
RUN make
RUN echo "magnetikonline: Xdebug 2.2.5" > description-pak && checkinstall -Dy --install=no --nodoc make -i install

CMD ["/bin/bash"]
