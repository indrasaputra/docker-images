FROM ubuntu:bionic AS builder
RUN apt-get update && \
    apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    wget \
    gnupg-agent
RUN curl -sSL https://packagecloud.io/golang-migrate/migrate/gpgkey | apt-key add -
RUN echo "deb https://packagecloud.io/golang-migrate/migrate/ubuntu/ bionic main" > /etc/apt/sources.list.d/migrate.list
RUN apt-get update && \
    apt-get install -y migrate
RUN WAIT_FOR_VERSION=v2.1.2 && \
    wget -qO/bin/wait-for https://github.com/eficode/wait-for/releases/download/${WAIT_FOR_VERSION}/wait-for && \
    chmod +x /bin/wait-for

FROM golang:1.17-alpine3.13
ENV GODOG_VERSION=v0.12.1
ENV GOIMPORTS_VERSION=v0.1.8
RUN apk update && apk add --no-cache git \
    make \
    bash \
    alpine-sdk
RUN GO111MODULE=on go get github.com/cucumber/godog/cmd/godog@${GODOG_VERSION}
RUN go install golang.org/x/tools/cmd/goimports@${GOIMPORTS_VERSION}
COPY --from=builder /usr/local/bin/migrate /usr/local/bin/migrate
COPY --from=builder /bin/wait-for /usr/local/bin/wait-for