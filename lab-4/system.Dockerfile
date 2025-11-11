FROM golang:1.24.6-alpine3.22 as system

RUN apk add --no-cache git ca-certificates && \
go install github.com/pressly/goose/v3/cmd/goose@latest && \
go clean -cache && go clean -modcache

WORKDIR /app