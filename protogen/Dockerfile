FROM golang:1.18-alpine3.16 as builder

ENV HOME=/home
ENV GO111MODULE=on
ENV BUF_VERSION=v1.8.0
ENV PROTOC_GEN_GO=v1.28.0
ENV PROTOC_GEN_GO_GRPC=v1.2.0
ENV PROTOC_GEN_GO_GRPC_GATEWAY=v2.10.3
ENV PROTOC_GEN_GRPC_OPENAPIV2_VERSION=v2.10.3
ENV GOLANGCI_LINT_VERSION=v1.49.0
ENV GOIMPORTS_VERSION=v0.1.11
ENV CLANG_FORMAT_VERSION=v1.6.0
ENV PROTOLINT_VERSION=0.38.1

RUN mkdir -p ${HOME}/.cache && \
    chmod 777 ${HOME}/.cache

RUN apk add build-base \
    bash \
    curl \
    git

RUN curl -sSL "https://github.com/bufbuild/buf/releases/download/${BUF_VERSION}/buf-Linux-x86_64" -o /usr/local/bin/buf
RUN chmod +x /usr/local/bin/buf
RUN curl -sSL "https://github.com/angular/clang-format/raw/${CLANG_FORMAT_VERSION}/bin/linux_x64/clang-format" -o /usr/local/bin/clang-format
RUN chmod +x /usr/local/bin/clang-format
RUN curl -sSfL "https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh" | sh -s -- -b $(go env GOPATH)/bin ${GOLANGCI_LINT_VERSION}

ADD https://github.com/yoheimuta/protolint/releases/download/v${PROTOLINT_VERSION}/protolint_${PROTOLINT_VERSION}_Linux_x86_64.tar.gz /
RUN tar -xzf /protolint_${PROTOLINT_VERSION}_Linux_x86_64.tar.gz -C /usr/local/bin && \
    rm -rf /protolint_${PROTOLINT_VERSION}_Linux_x86_64.tar.gz

RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@${PROTOC_GEN_GO}
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@${PROTOC_GEN_GO_GRPC}
RUN go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@${PROTOC_GEN_GO_GRPC_GATEWAY}
RUN go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@${PROTOC_GEN_GRPC_OPENAPIV2_VERSION}
RUN go install golang.org/x/tools/cmd/goimports@${GOIMPORTS_VERSION}
