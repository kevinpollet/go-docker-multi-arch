# go-docker-multi-arch

The purpose of this repository is to show how to build a multi-arch Docker image from the command-line for `amd64`
and `arm64` architectures. The Go application built inside the Docker image displays the OS, Architecture and Go version
of the runtime environment.

The [buildx](https://docs.docker.com/buildx/working-with-buildx/#build-multi-platform-images) plugin allows to build and
push multi-platform images from the command-line. The following command will create and use
a `buildx` [builder instance](https://docs.docker.com/buildx/working-with-buildx/#work-with-builder-instances):

```shell
$ docker buildx create --name multi-arch --use 
```

Build and push the multi-arch Docker image with:

```shell
$ docker buildx build --platform=linux/amd64,linux/arm64 -t <repository_name>/go-docker-multi-arch --push .
```

Using both images on Apple Silicon will output the following:

```shell
$ docker run --rm <repository_name>/go-docker-multi-arch
OS/Arch:    linux/arm64
Go version: go1.17.11

$ docker run --platform linux/amd64 --rm <repository_name>/go-docker-multi-arch
OS/Arch:    linux/amd64
Go version: go1.17.11
```

## License

[MIT](./LICENSE)
