# Nginx Proxy with self-signed certificate 

On docker hub: https://hub.docker.com/r/shrank3000/docker-nginx-self-signed-https

This is a small docker image which can be used as a reverse proxy before your
local running service. It acts as a HTTP terminating proxy.

## Usage

```bash
docker run -d --name app-proxy --net host \
           -e REMOTE_URL=http://127.0.0.1:8080 \
           shrank3000/docker-nginx-self-signed-https:latest
```
