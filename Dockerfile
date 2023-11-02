FROM nginx:1.23

COPY nginx-default.conf /etc/nginx/conf.d/default.conf
COPY run.sh /run.sh

VOLUME /etc/nginx/certs/

ENV NGINX_PORT=443
ENV REMOTE_URL="http://localhost:8080/"

CMD ["/run.sh"]
