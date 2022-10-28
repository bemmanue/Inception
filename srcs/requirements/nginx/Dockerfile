FROM debian:buster

ARG DOMAIN_NAME

RUN apt update && apt install -y nginx

COPY ./tools /etc/ssl/certs/
COPY ./conf /etc/nginx/conf.d/

RUN sed -i "s/domain_name/$DOMAIN_NAME/" /etc/nginx/conf.d/my_domain.conf

CMD ["nginx", "-g", "daemon off;"]
