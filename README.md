# alpine-apache2-fancy
Code for a simple container with Apache httpd fancy index configured

## Disclaimer
The __docker-entrypoint__ checks if the correct folder are linked, for this remove the basic folder __/var/www/localhost/htdocs__ and then link the mounted volume.

The container could remove the data in the volume, please mount the volume in read only adding __:ro__ at the end of the volume statement.  

## Getting Started
If you want to use this container you must build the Dockerfile with the content of this repository or use the pushed image to [DockerHub](https://hub.docker.com/r/rdcarrera/alpine-apache2-fancy/)

### Prerequisites
You need the next tools to use this container:
```
* GIT Client
* Docker service
* Docker build tools
```
You must mount a volume to show over the fancy index,  __PATH_TO_MOUNT__ in the instructions

You must pass a port to remote access to the container,
__EXTERNAL_PORT__ in the instructions

## INSTRUCTIONS
### Instructions for build container image
```
* git clone https://github.com/rdcarrera/alpine-apache2-fancy.git
* cd alpine-apache2-fancy
* docker build -t example/tag:0.1 .
* docker run -dit --name alpine-apache2-fancy -v PATH_TO_MOUNT:/fancy/mount:ro -p EXTERNAL_PORT:80 example/tag:0.1
```
### Instruction for run container from docker [DockerHub](https://hub.docker.com/r/rdcarrera/alpine-apache2-fancy/)

```
* docker run -dit --name alpine-apache2-fancy -v PATH_TO_MOUNT:/fancy/mount:ro -p EXTERNAL_PORT:80 rdcarrera/alpine-apache2-fancy
```

### Change logo
If you want to change the default logo you have to mount the next volume:
```
-v /path/to/your/logo.png:/fancy/html/logo/logo.png
```

## SCREENSHOOTS
![alt text](https://raw.githubusercontent.com/rdcarrera/alpine-apache2-fancy/master/screenshoots/01_screenshoot.png)
