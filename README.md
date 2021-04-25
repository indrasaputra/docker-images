# Docker Images

This repository contains a collection of docker images.

## Images

Currently, there is only one image available.

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