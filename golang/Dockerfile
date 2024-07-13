FROM golang:golang:1.23-rc-alpine3.20 as builder

ENV MIGRATE_VERSION=v4.17.1
ENV WAIT_FOR_VERSION=v2.2.4

ADD https://github.com/golang-migrate/migrate/releases/download/${MIGRATE_VERSION}/migrate.linux-amd64.tar.gz /
RUN tar -xzf /migrate.linux-amd64.tar.gz && rm -rf LICENSE README && \
    mv migrate /usr/bin/migrate && \
    chmod +x /usr/bin/migrate

RUN wget -qO/bin/wait-for https://github.com/eficode/wait-for/releases/download/${WAIT_FOR_VERSION}/wait-for && \
    chmod +x /bin/wait-for

# final image
FROM golang:golang:1.23-rc-alpine3.20

ENV GODOG_VERSION=v0.14.1
ENV GOIMPORTS_VERSION=v0.23.0

RUN apk update && apk add --no-cache git \
    make \
    bash \
    alpine-sdk
RUN GO111MODULE=on go install github.com/cucumber/godog/cmd/godog@${GODOG_VERSION}
RUN go install golang.org/x/tools/cmd/goimports@${GOIMPORTS_VERSION}
COPY --from=builder /usr/bin/migrate /usr/local/bin/migrate
COPY --from=builder /bin/wait-for /usr/local/bin/wait-for
