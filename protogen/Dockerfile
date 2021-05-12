FROM golang:1.16-alpine3.13 as builder

ENV HOME=/home
ENV GO111MODULE=on
ENV BUF_VERSION=v0.41.0
ENV PROTOC_GEN_GO=v1.26.0
ENV PROTOC_GEN_GO_GRPC=v1.1.0
ENV PROTOC_GEN_GO_GRPC_GATEWAY=v2.3.0
ENV PROTOC_GEN_GRPC_OPENAPIV2_VERSION=v2.3.0
ENV GOLANGCI_LINT_VERSION=v1.39.0
ENV GOIMPORTS_VERSION=v0.1.0
ENV CLANG_FORMAT_VERSION=v1.4.0

RUN mkdir -p ${HOME}/.cache && \
    chmod 777 ${HOME}/.cache

RUN apk add build-base \
    bash \
    curl

RUN curl -sSL "https://github.com/bufbuild/buf/releases/download/${BUF_VERSION}/buf-Linux-x86_64" -o /usr/local/bin/buf
RUN chmod +x /usr/local/bin/buf
RUN curl -sSL "https://github.com/angular/clang-format/raw/${CLANG_FORMAT_VERSION}/bin/linux_x64/clang-format" -o /usr/local/bin/clang-format
RUN chmod +x /usr/local/bin/clang-format

RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@${PROTOC_GEN_GO}
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@${PROTOC_GEN_GO_GRPC}
RUN go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@${PROTOC_GEN_GO_GRPC_GATEWAY}
RUN go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@${PROTOC_GEN_GRPC_OPENAPIV2_VERSION}
RUN go install github.com/golangci/golangci-lint/cmd/golangci-lint@${GOLANGCI_LINT_VERSION}
RUN go install golang.org/x/tools/cmd/goimports@${GOIMPORTS_VERSION}