#!/bin/bash -e

./configure \
	--with-config-file-path=/etc/php7 \
	--disable-all \
	--disable-cgi \
	--enable-bcmath \
	--enable-fpm \
	--enable-hash \
	--enable-json \
	--enable-libxml \
	--enable-mbstring \
	--enable-opcache \
	--enable-session \
	--enable-xml \
	--with-curl \
	--with-gd \
	--with-jpeg-dir=/usr \
	--with-mysql \
	--with-mysqli \
	--with-png-dir=/usr \
	--with-sqlite3 \
	--without-pear
