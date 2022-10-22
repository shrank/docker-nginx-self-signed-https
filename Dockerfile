FROM nginx:1.23

COPY cert.crt /etc/nginx/cert.crt
COPY cert.key /etc/nginx/cert.key
COPY nginx-default.conf /etc/nginx/conf.d/default.conf
COPY run.sh /run.sh

VOLUME /etc/nginx/certs/

ENV REMOTE_URL="http://localhost:8080/"

CMD ["/run.sh"]
