# Docker deb builders
Collection of [Docker](https://www.docker.com) images to build Debian/Ubuntu deb packages. All tested under Ubuntu 18.04LTS (previously 14.04LTS).

- For each package, given `Dockerfile` will build an OS image and create a target deb package using [`checkinstall`](https://help.ubuntu.com/community/CheckInstall).
- Each `extractdeb.sh` script will then:
	- Execute the image in a new container.
	- Extract deb package back to the host file system.
	- Destroy the container.

When installing package on target system remember that dependent packages will need to be installed manually, they are not brought over by the `checkinstall` process.

**For Ubuntu:** The Docker package from the official Ubuntu repositories is named `docker.io` due to ([somewhat](https://packages.ubuntu.com/trusty/docker.io) [inconveniently](https://packages.ubuntu.com/xenial/docker.io)) an existing package clash. All build scripts assume you have symlinked the `docker.io` binary like so:

```sh
$ sudo apt install docker.io
$ sudo ln --force --symbolic /usr/bin/docker.io /usr/local/bin/docker
```

Alternatively (and probably better), install latest stable [`docker-ce`](https://docs.docker.com/install/linux/docker-ce/ubuntu/) package from Docker's own repository.

## Nginx
- **OS:** Ubuntu 18.04LTS
- **Version:** 1.14.0
- **Configure:** [`nginx/resource/configure.sh`](nginx/resource/configure.sh)

Create and extract package:

```sh
$ ./build.sh
# waiting... as Docker builds image

$ ./extractdeb.sh
# package extract from container

$ ls -l nginx_1.14.0-1_amd64.deb
-rw-r--r-- 1 root root 258844 May 8 14:08 nginx_1.14.0-1_amd64.deb
```

Install on target system:

```sh
# should be no dependent packages needed - based off packaged configure.sh
$ sudo dpkg -i /path/to/nginx_1.14.0-1_amd64.deb
```

## PHP-FPM
- **OS:** Ubuntu 18.04LTS
- **Version:** 7.2.21 (PHP-FPM and CLI)
- **Configure:** [`phpfpm/resource/configure.sh`](phpfpm/resource/configure.sh)

Create and extract package:

```sh
$ ./build.sh
# waiting... as Docker builds image

$ ./extractdeb.sh
# package extract from container

$ ls -l php_7.2.21-1_amd64.deb
-rw-r--r-- 1 root root 9618732 Aug 23 23:18 php_7.2.21-1_amd64.deb
```

Install on target system:

```sh
# install dependent packages - based off packaged configure.sh
$ sudo apt install libcurl3 libjpeg62
$ sudo dpkg -i /path/to/php_7.2.21-1_amd64.deb
```
