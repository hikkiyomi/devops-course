FROM golang:1.24.6-alpine3.22 AS builder

RUN apk add --no-cache git ca-certificates && \
    go install github.com/pressly/goose/v3/cmd/goose@latest

WORKDIR /app
COPY task-tracker/go.mod task-tracker/go.sum ./
RUN go mod download

COPY task-tracker .
RUN go build cmd/main.go

FROM alpine:3.22

RUN apk add --no-cache ca-certificates tzdata postgresql-client && \
    adduser -D appuser

COPY --from=builder /go/bin/goose /usr/local/bin/goose
COPY --from=builder /app/main /app/main
COPY --from=builder /app/migrations /app/migrations

RUN chown -R appuser:appuser /app
USER appuser
WORKDIR /app

ENTRYPOINT ["sh", "-c", "goose -dir migrations postgres 'postgresql://postgres:postgres@postgres:5432/postgres' up && ./main"]
