FROM ubuntu:16.04
MAINTAINER Peter Mescalchin <peter@magnetikonline.com>

ENV VERSION 1.12.2

RUN apt-get update && apt-get upgrade --yes && \
	apt-get install --yes checkinstall libpcre3-dev zlib1g-dev && \
	apt-get clean

ADD https://nginx.org/download/nginx-$VERSION.tar.gz /root/build/
WORKDIR /root/build
RUN tar -xf nginx-$VERSION.tar.gz

ADD ./resource/configure.sh /root/build/nginx-$VERSION/
WORKDIR /root/build/nginx-$VERSION
RUN chmod u+x configure.sh
RUN ./configure.sh && make

RUN echo "magnetikonline: Nginx" >description-pak && \
	checkinstall \
		--default \
		--install=no \
		--nodoc \
		--pkgname=nginx \
		--pkgversion=$VERSION \
		--type=debian \
			make --ignore-errors install

CMD ["/bin/bash"]
