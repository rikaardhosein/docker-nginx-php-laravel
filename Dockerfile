FROM ubuntu:18.04

EXPOSE 80

RUN  ln -fs /usr/share/zoneinfo/America/Port_of_Spain /etc/localtime

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -yq install nginx php7.2 php7.2-fpm php7.2-mbstring php-tokenizer \
      php7.2-bcmath php7.2-json php7.2-xml composer

COPY nginx_config/default /etc/nginx/sites-available

RUN mkdir /run/php

CMD /usr/sbin/php-fpm7.2 -D; nginx -g "daemon off;"

