# Docker Images

This repository contains a collection of docker images.

## Images

Currently, there are two images available.

### golang

`golang` is an image containing golang, golang-migrate, godog, and goimports.
See more in [golang/Dockerfile](/golang/Dockerfile).

### protogen

`protogen` is an image containing protoc, buf, and grpc related binaries.
See more in [protogen/Dockerfile](/protogen/Dockerfile).

## Build

To build an image, run this command:

```
$ make build.<image-name> <version>
```

e.g:

```
$ make build.protogen 0.0.1
```