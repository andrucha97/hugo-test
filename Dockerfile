FROM klakegg/hugo:latest AS builder

COPY . /src

RUN hugo

FROM nginx:alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
#COPY public /var/www/
COPY --from=builder /src/public /var/www/
