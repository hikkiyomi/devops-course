FROM alpine:3.22.2

RUN apk update && \
    apk --no-cache add nginx && \
    mkdir -p /var/www/html && \
    adduser -D -g 'nginxuser' nginxuser && \
    mkdir -p \
    /var/log/nginx \
    /var/tmp/nginx \
    /var/lib/nginx \
    /run/nginx && \
    chown -R nginxuser:nginxuser \
    /var/www/html \
    /var/log/nginx \
    /var/tmp/nginx \
    /var/lib/nginx \
    /run/nginx \
    /etc/nginx

COPY --chown=nginxuser:nginxuser nginx.conf /etc/nginx/nginx.conf
USER nginxuser
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
