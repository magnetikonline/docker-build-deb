# Docker deb package builders
Collection of [Docker](https://www.docker.io/) images to build Debian/Ubuntu deb packages. All tested under a Ubuntu 14.04LTS host, but should work for any host that supports Docker.

- For each package a `Dockerfile` will build the OS image and create the deb package using [`checkinstall`](https://help.ubuntu.com/community/CheckInstall).
- The `extractdeb.sh` script will then:
	- run the image in a container
	- extract the deb package back to the host file system
	- destroy the container

When installing package on target system remember that dependent packages will need to be installed manually, they are not brought over by `checkinstall`.

**Notes for Ubuntu 14.04LTS:** The Docker package in the Ubuntu repositories is (somewhat inconveniently) named `docker.io` due to a clash with an existing package. All build scripts assume you have symlinked the `docker.io` binary like so:

```sh
$ sudo apt-get install docker.io
$ ln -sf /usr/bin/docker.io /usr/local/bin/docker
```

## Nginx
- **OS:** Ubuntu 14.04LTS
- **Version:** 1.6.1
- **Configure:** [nginx/resource/configure.sh](nginx/resource/configure.sh)

Create and extract package:
```sh
$ ./build.sh
# waiting... as Docker builds image

$ ./extractdeb.sh
# package extract from container

$ ls -l nginx_1.6.1-1_amd64.deb
-rw-r--r-- 1 root root 178012 May 22 20:54 nginx_1.6.1-1_amd64.deb
```

Install on target system:
```sh
# Should be no dependent packages needed - based off configure.sh
$ sudo dpkg -i /path/to/nginx_1.6.1-1_amd64.deb
```

## PHP-FPM
- **OS:** Ubuntu 14.04LTS
- **Version:** 5.5.15 (PHP-FPM and CLI only)
- **Configure:** [phpfpm/resource/configure.sh](phpfpm/resource/configure.sh)

Create and extract package:
```sh
$ ./build.sh
# waiting... as Docker builds image

$ ./extractdeb.sh
# package extract from container

$ ls -l php_5.5.15-1_amd64.deb
-rw-r--r-- 1 root root 178012 May 22 21:12 php_5.5.15-1_amd64.deb
```

Install on target system:
```sh
# Install dependent packages - based off configure.sh
$ sudo apt-get install libjpeg62 libxml2 libcurl3
$ sudo dpkg -i /path/to/php_5.5.15-1_amd64.deb
```
