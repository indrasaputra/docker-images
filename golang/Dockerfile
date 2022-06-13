FROM golang:1.18-alpine3.16 as builder
    
ENV MIGRATE_VERSION=v4.15.1
ENV WAIT_FOR_VERSION=v2.1.2

ADD https://github.com/golang-migrate/migrate/releases/download/${MIGRATE_VERSION}/migrate.linux-amd64.tar.gz /
RUN tar -xzf /migrate.linux-amd64.tar.gz && rm -rf LICENSE README && \
    mv migrate /usr/bin/migrate && \
    chmod +x /usr/bin/migrate

RUN wget -qO/bin/wait-for https://github.com/eficode/wait-for/releases/download/${WAIT_FOR_VERSION}/wait-for && \
    chmod +x /bin/wait-for

# final image
FROM golang:1.18-alpine3.16

ENV GODOG_VERSION=v0.12.5
ENV GOIMPORTS_VERSION=v0.1.11

RUN apk update && apk add --no-cache git \
    make \
    bash \
    alpine-sdk
RUN GO111MODULE=on go install github.com/cucumber/godog/cmd/godog@${GODOG_VERSION}
RUN go install golang.org/x/tools/cmd/goimports@${GOIMPORTS_VERSION}
COPY --from=builder /usr/bin/migrate /usr/local/bin/migrate
COPY --from=builder /bin/wait-for /usr/local/bin/wait-for
