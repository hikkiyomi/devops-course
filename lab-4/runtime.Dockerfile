FROM alpine:3.22 as runtime

WORKDIR /app

COPY --from=build /app/main /app/main
COPY --from=build /go/bin/goose /usr/local/bin/goose
COPY task-tracker/migrations /app/migrations

RUN adduser -D appuser && \
    mkdir -p /app && \
    chown -R appuser:appuser /app

USER appuser

ENTRYPOINT ["sh", "-c", "goose -dir migrations postgres 'postgresql://postgres:postgres@postgres:5432/postgres' up && ./main"]