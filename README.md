# Dev Proxy for Docker

## About

The purpose of this project is to provide a setup to run a dev HTTP/HTTPS proxy in a local enviroment using docker.

This repository assumes you have `docker`, `docker-compose` and `git` installed.

## Using

Now, whenever a container starts running, you should be able to see it on Consul UI and access it using its name followed by `localhost`.

If the container is a http based container, like NGINX, you can use `SERVICE_NAME.localhost` domain with port 80 or 3000. Accessing http://my-node.localhost:3000 will redirect to http://my-node.localhost:3000.

If you need to use a subdomain, you can use http://mysubdomain.my-node.localhost:3000.
