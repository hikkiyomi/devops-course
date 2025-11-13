FROM system as build

WORKDIR /app

COPY task-tracker/go.mod task-tracker/go.sum ./
RUN go mod download

COPY task-tracker .
RUN go build -o /app/main cmd/main.go
