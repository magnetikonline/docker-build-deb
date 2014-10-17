# Docker deb package builders
Collection of [Docker](https://www.docker.com) images to build Debian/Ubuntu deb packages. All tested under Ubuntu 14.04LTS, but should work for any host that supports Docker.

- For each package a `Dockerfile` will build the OS image and create the deb package using [`checkinstall`](https://help.ubuntu.com/community/CheckInstall).
- The `extractdeb.sh` script will then:
	- run the image in a container
	- extract deb package back to the host file system
	- destroy the container

When installing package on target system remember that dependent packages will need to be installed manually, they are not brought over by the `checkinstall` process.

**Notes for Ubuntu 14.04LTS:** The Docker package in the Ubuntu repositories is (somewhat inconveniently) named `docker.io` due to an existing package clash. All build scripts assume you have symlinked the `docker.io` binary like so:

```sh
$ sudo apt-get install docker.io
$ ln -sf /usr/bin/docker.io /usr/local/bin/docker
```

Alternatively (and probably a better idea), you can install the latest stable [`lxc-docker`](https://docs.docker.com/installation/ubuntulinux/#ubuntu-trusty-1404-lts-64-bit) package from Docker's own repository.

## Nginx
- **OS:** Ubuntu 14.04LTS
- **Version:** 1.6.2
- **Configure:** [nginx/resource/configure.sh](nginx/resource/configure.sh)

Create and extract package:
```sh
$ ./build.sh
# waiting... as Docker builds image

$ ./extractdeb.sh
# package extract from container

$ ls -l nginx_1.6.2-1_amd64.deb
-rw-r--r-- 1 root root 178434 Sep 18 11:21 nginx_1.6.2-1_amd64.deb
```

Install on target system:
```sh
# should be no dependent packages needed - based off packaged configure.sh
$ sudo dpkg -i /path/to/nginx_1.6.2-1_amd64.deb
```

## PHP-FPM
- **OS:** Ubuntu 14.04LTS
- **Version:** 5.6.2 (PHP-FPM and CLI)
- **Configure:** [phpfpm/resource/configure.sh](phpfpm/resource/configure.sh)

Create and extract package:
```sh
$ ./build.sh
# waiting... as Docker builds image

$ ./extractdeb.sh
# package extract from container

$ ls -l php_5.6.2-1_amd64.deb
-rw-r--r-- 1 root root 5145300 Oct 18 09:59 php_5.6.2-1_amd64.deb
```

Install on target system:
```sh
# install dependent packages - based off packaged configure.sh
$ sudo apt-get install libjpeg62
$ sudo dpkg -i /path/to/php_5.6.2-1_amd64.deb
```
