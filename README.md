# alpine-apache2-fancy
Code for a simple container with Apache httpd fancy index configured

<a name="table"></a>
## Table of Contents
1. [Disclaimer](#disclaimer-)
2. [Getting Started](#getting-started-)
  * [Container info](#container-info-)
  * [Prerequisites](#prerequisites-)
3. [INSTRUCTIONS](#instructions-)
  * [Instructions to build container image](#instructions-to-build-container-image-)
  * [Instruction to run container from docker](#instruction-to-run-container-from-docker-dockerhub-)
  * [Custom logo](#custom-logo-)
4.  [SCREENSHOOTS](#screenshoots-)
5.  [VERSION History](#version-history-)
6.  [Author](#author-)
7.  [Mentions](#mentions-)

## Disclaimer [<img src="https://image.flaticon.com/icons/svg/23/23714.svg" alt="drawing" width="20"/>](#table)
The container could remove the data in the volume, please mount the volume in read only adding __:ro__ at the end of the volume statement.  

## Getting Started [<img src="https://image.flaticon.com/icons/svg/23/23714.svg" alt="drawing" width="20"/>](#table)
If you want to use this container you must build the Dockerfile with the content of this repository or use the pushed image to [DockerHub](https://hub.docker.com/r/rdcarrera/alpine-apache2-fancy/)

### Container info [<img src="https://image.flaticon.com/icons/svg/23/23714.svg" alt="drawing" width="20"/>](#table)

| CONTAINER ENGINE | OS | WEBSERVER |
|:---------:|:---------:|:---------:|
| <img src="https://www.docker.com/sites/default/files/vertical.png" alt="drawing" width="100"/> | <img src="https://upload.wikimedia.org/wikipedia/commons/f/f0/Alpinelinux_logo.png" alt="drawing" width="100"/> | <img src="https://www.apache.org/foundation/press/kit/feather_small.png" alt="drawing" width="70"/> |


### Prerequisites [<img src="https://image.flaticon.com/icons/svg/23/23714.svg" alt="drawing" width="20"/>](#table)
You need the next tools to use this container:
```
* GIT Client
* Docker service
* Docker build tools
```
You must mount a volume to show over the fancy index,  __PATH_TO_MOUNT__ in the instructions

You must pass a port to remote access to the container,
__EXTERNAL_PORT__ in the instructions

## INSTRUCTIONS [<img src="https://image.flaticon.com/icons/svg/23/23714.svg" alt="drawing" width="20"/>](#table)
### Instructions to build container image [<img src="https://image.flaticon.com/icons/svg/23/23714.svg" alt="drawing" width="20"/>](#table)
```
git clone https://github.com/rdcarrera/alpine-apache2-fancy.git
cd alpine-apache2-fancy
docker build -t example/tag:0.1 .
docker run -d --name alpine-apache2-fancy -v PATH_TO_MOUNT:/fancy/mount:ro -p EXTERNAL_PORT:8080 example/tag:0.1
```
### Instruction to run container from docker [DockerHub](https://hub.docker.com/r/rdcarrera/alpine-apache2-fancy/) [<img src="https://image.flaticon.com/icons/svg/23/23714.svg" alt="drawing" width="20"/>](#table)

```
docker run -d --name alpine-apache2-fancy -v PATH_TO_MOUNT:/fancy/mount:ro -p EXTERNAL_PORT:8080 rdcarrera/alpine-apache2-fancy
```

### Custom logo [<img src="https://image.flaticon.com/icons/svg/23/23714.svg" alt="drawing" width="20"/>](#table)
If you want to use a custom logo you've' to mount the next volume:
```
-v /path/to/your/logo.png:/fancy/html/logo/logo.png
```

## SCREENSHOOTS [<img src="https://image.flaticon.com/icons/svg/23/23714.svg" alt="drawing" width="20"/>](#table)
![alt text](https://raw.githubusercontent.com/rdcarrera/alpine-apache2-fancy/master/screenshoots/01_screenshoot.png)

## VERSION History [<img src="https://image.flaticon.com/icons/svg/23/23714.svg" alt="drawing" width="20"/>](#table)
[VERSION History](https://github.com/rdcarrera/alpine-apache2-fancy/blob/master/VERSION.md)

## Author [<img src="https://image.flaticon.com/icons/svg/23/23714.svg" alt="drawing" width="20"/>](#table)
[<img src="https://avatars0.githubusercontent.com/u/26046280?s=460&v=4"/>](https://github.com/rdcarrera)

## Mentions [<img src="https://image.flaticon.com/icons/svg/23/23714.svg" alt="drawing" width="20"/>](#table)
Arrow logo taken from: https://www.flaticon.com/free-icon/up-arrow_23714
