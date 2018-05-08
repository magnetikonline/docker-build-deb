FROM ubuntu:18.04
MAINTAINER Peter Mescalchin <peter@magnetikonline.com>

ENV VERSION "7.2.5"

RUN apt-get update && apt-get upgrade --yes && \
	apt-get install --yes checkinstall libcurl4-openssl-dev libjpeg62-dev libpng-dev libxml2-dev && \
	apt-get clean

ADD "https://php.net/get/php-$VERSION.tar.gz/from/this/mirror" "/root/build/php-$VERSION.tar.gz"
WORKDIR /root/build
RUN tar --extract --file "php-$VERSION.tar.gz"

ADD ./resource/configure.sh "/root/build/php-$VERSION/"
WORKDIR "/root/build/php-$VERSION"
RUN chmod u+x configure.sh
RUN ./configure.sh && make

RUN echo "magnetikonline: PHP (with FPM)" >description-pak && \
	checkinstall \
		--default \
		--install=no \
		--nodoc \
		--pkgname=php \
		--pkgversion=$VERSION \
		--type=debian \
			make install

CMD ["/bin/bash"]
