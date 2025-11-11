FROM golang:1.24.6-alpine3.22

RUN apk add --no-cache git ca-certificates && \
    go install github.com/pressly/goose/v3/cmd/goose@latest

WORKDIR /app
COPY task-tracker/go.mod task-tracker/go.sum ./
RUN go mod download

COPY task-tracker .
RUN go build cmd/main.go

RUN adduser -D appuser && chown -R appuser:appuser /app
USER appuser
WORKDIR /app

ENTRYPOINT ["sh", "-c", "goose -dir migrations postgres 'postgresql://postgres:postgres@postgres:5432/postgres' up && ./main"]
