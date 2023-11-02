# Nginx Proxy with self-signed certificate 

On docker hub: https://hub.docker.com/r/shrank3000/docker-nginx-self-signed-https

This is a small docker image which can be used as a reverse proxy before your
local running service. It acts as a HTTP terminating proxy.

## Usage

```
version: '3'

volumes:
  ssl_cert: {}

services:
  frontend:
    image: shrank3000/docker-nginx-self-signed-https:latest
    volumes:
      - ssl_cert:/etc/nginx/certs/
    ports:
      - "443:443"
    environment:
      - REMOTE_URL="http://your-app-container:80"
```

This will cerate new certs on startup.
