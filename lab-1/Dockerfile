FROM alpine:3.22.2

RUN apk --no-cache add nginx && mkdir -p /var/www/html
COPY --chown=nginx:nginx nginx.conf /etc/nginx/nginx.conf
USER nginx
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
