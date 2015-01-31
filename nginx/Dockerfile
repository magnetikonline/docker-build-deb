FROM ubuntu:14.04.1
MAINTAINER Peter Mescalchin "peter@magnetikonline.com"

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install checkinstall libpcre3-dev zlib1g-dev
RUN apt-get clean

RUN mkdir /root/build
ADD http://nginx.org/download/nginx-1.6.2.tar.gz /root/build/
WORKDIR /root/build
RUN tar xf nginx-1.6.2.tar.gz

ADD ./resource/configure.sh /root/build/nginx-1.6.2/
WORKDIR /root/build/nginx-1.6.2
RUN chmod a+x configure.sh
RUN ./configure.sh && make
RUN echo "magnetikonline: Nginx 1.6.2" > description-pak && checkinstall -Dy --install=no --nodoc make -i install

CMD ["/bin/bash"]
