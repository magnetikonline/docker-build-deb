FROM ubuntu:18.04
MAINTAINER Peter Mescalchin <peter@magnetikonline.com>

ENV VERSION "1.14.0"

RUN apt-get update && apt-get upgrade --yes && \
	apt-get install --yes checkinstall libpcre3-dev zlib1g-dev && \
	apt-get clean

ADD "https://nginx.org/download/nginx-$VERSION.tar.gz" /root/build/
WORKDIR /root/build
RUN tar --extract --file "nginx-$VERSION.tar.gz"

ADD ./resource/configure.sh "/root/build/nginx-$VERSION/"
WORKDIR "/root/build/nginx-$VERSION"

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
			make install

CMD ["/bin/bash"]
