# Traefik

I use Traefik using several different files for services and middlewares.

<h2>Features</h2>

- [Setting Up SSL and Traefik](#setting-up-ssl-and-traefik)
  - [Creating the `dynamic` Directory](#creating-the-dynamic-directory)
  - [Linking the SSL Certificates to Traefik](#linking-the-ssl-certificates-to-traefik)
  - [Linking the Traefik Container/Service](#linking-the-traefik-containerservice)
- [Services](#services)
  - [Working with Docker Containers](#working-with-docker-containers)
  - [Working with Independent Services on Different Ports](#working-with-independent-services-on-different-ports)
- [Middlewares](#middlewares)
  - [Redirect HTTP to HTTPS](#redirect-http-to-https)
  - [Path Strips](#path-strips)
  - [Basic Web Authentication](#basic-web-authentication)
    - [Creating a User](#creating-a-user)
- [SSH Reverse Tunneling](#ssh-reverse-tunneling)
  - [Bonus: Using Traefik on the Public Server](#bonus-using-traefik-on-the-public-server)

## Setting Up SSL and Traefik

### Creating the `dynamic` Directory

The `dynamic` directory is where all the routes are stored and configured for Traefik to 'see'. To create it, run:

```bash
mkdir dynamic
```

### Linking the SSL Certificates to Traefik

In order to use SSL with Traefik, it needs to know where the SSL certificates are. If you generated them, using the [`generate.sh`](certs/generate.sh) script then they are already in the right directory. What's needed next is to tell Traefik which direction to look. There's already an example configuration in the `example-dynamic` directory so you can just quickly copy it with:

```bash
cp example-dynamic/tls-certificates.yml /dynamic
```

### Linking the Traefik Container/Service

Although the Traefik container has been configured and set up, you won't be able to view the dashboard until it has a corresponding configuration file within the `dynamic` directory.

There is already an example file in the [`example-dynamic/services` directory](example-dynamic/services). To copy it, run:

```bash
cp example-dynamic/services/traefik-service.yml dynamic/
```

Once it is up and running, you can visit `tk.local.test` (or whatever domain you decided on) to visit the dashboard. If you want to change the subdomain, simply make an edit to the `traefik-service.yml` file.

## Services

Services are either docker containers or projects you have running on different ports on your local machine. Just like the `traefik-service.yml` you can create a file for each service in the `dynamic` directory.

### Working with Docker Containers

For docker projects, you can use [`example-dynamic/services/container-service.yml`](example-dynamic/services/container-service.yml) as a template.

### Working with Independent Services on Different Ports

For locally running services, that might be using a process manager such as [PM2][pm2-manager], you can use [`example-dynamic/services/http-service.yml`](example-dynamic/services/http-service.yml) as a template.

## Middlewares

Middlewares help filter traffic through Traefik (see what I did there? 😏)
There are several different middlewares you can make use of with Traefik (check their docs), but I will only mention the few I find most useful, for my usage. To enable middlewares, they must be in the `dynamic` directory.

Then, in the `middlewares` array in a service router configuration, you can list it with its middleware name and append `@file` to it as the middleware configuration is contained in a file e.g. `redirecthttp@file`.

### Redirect HTTP to HTTPS

This makes use of the [`example-dynamic/middlewares/middleware-redirect-http.yml`](example-dynamic/middlewares/middleware-redirect-http.yml) file. To enable it's usage you will have to copy it to the `dynamic` directory like so:

```bash
cp example-dynamic/middlewares/middleware-redirect-http.yml dynamic/
```

### Path Strips

This middleware makes use of [`example-dynamic/middlewares/middleware-path-strips.yml`](example-dynamic/middlewares/middleware-path-strips.yml) to help with directing a domain with the suffix path to a particular service.

In the middleware configuration file, there is a `prefixes` array which is compared against the router service rule. For example, this would be a configuration for a container service:

```yml
http:
  routers:
    # earlier configurations omitted for brevity

    serviceName-fwd:
      rule: Host(`{{env "DOMAIN_NAME"}}`) && Path(`/serviceName`)
      entryPoints:
        - websecure
      middlewares:
        - pathstrip@file
      tls: {}
      service: serviceName-{{env "COMPOSE_PROJECT_NAME"}}@docker
```

### Basic Web Authentication

This makes use of the `basic-auth` middleware whose configuration can be found in the [`example-dynamic/middlewares/middleware-basic-auth.yml`](example-dynamic/middlewares/middleware-basic-auth.yml). To enable it's usage:

```bash
cp example-dynamic/middlewares/middleware-basic-auth.yml dynamic/
```

This particular middleware requires a users array in the `user:password` format using the `htpasswd` command.

On Ubuntu, it can be installed using the following command.

```bash
sudo apt-get install apache2-utils
```

On Arch Linux, it can be installed using the following commands:

```bash
sudo pacman -S apache

sudo cp /usr/bin/htpasswd /usr/local/bin/htpasswd

sudo pacman -Rncs apache
```

#### Creating a User

To create `user:password` pair, it's possible to use this command:

```bash
echo $(htpasswd -nb $USERNAME $PASSWORD) | sed -e s/\\$/\\$\\$/g

# user:$$apr1$$XreceAun$$aWg8Y/AUo0CJDeFixyRuT0
```

**Note:** All dollar signs in the hash need to be doubled for escaping.

**Note:** In a Kubernetes secret the string (e.g. generated by `htpasswd`) must be base64-encoded first. To create an encoded `user:password` pair, the following command can be used:

```bash
htpasswd -nb user password | openssl base64

# dXNlcjokYXByMSRUbGd6ZjZObCRpNDcuSUhFZ3QyMkIuU3o3enE4bGYuCgo=
```

Unrelated but, you can generate random strings by running the command:

```bash
openssl rand -base64 12

# +iemAiIxER8u1/CG8DuSl98WdM/T6l+uaw==
```

**Note:** To prevent the output of your secure strings to the terminal, you can make use of the `xclip` package and have the results copied to your clipboard. This will only work on your local machine though. For example:

```bash
openssl rand -base64 35 | xclip -selection clipboard
```

## SSH Reverse Tunneling

SSH reverse tunneling is what I use to expose a locally running service on a domain/server that is exposed to the internet. It works pretty much the same way as services such as [ngrok][ngrok-site].

For example, if I want to expose a service running on port `443` on my local machine on port `8000` on a server listening to the domain `local.domain.com` I would run the following command on my local machine:

```bash
ssh -R 8000:127.0.0.1:443 local.domain.com -v
```

The general command to run is:

```bash
ssh -R $REMOTE_PORT:127.0.0.1:$LOCAL_PORT $REMOTE_URL_OR_IP_ADDRESS -v
```

### Bonus: Using Traefik on the Public Server

If you are using Traefik on the server as well, you could easily use the [`example-dynamic/services/http-service.yml`](example-dynamic/services/http-service.yml) as a template. You would have to change the `$PORT_NUMBER_OF_SERVICE` variable to the value of the `$REMOTE_PORT` variable in the command above. Additionally, on the local machine, you would have to change the domain you are listening to on this machine to be the same as the one on the public server.

For example, this is what it would look like on your server config, if you had the domain `https://local.domain.com` being listened to by a service on your local machine:

```yml
http:
  routers:
    local:
      entryPoints:
        - web
      # Must listen to the same domain on your local machine service
      rule: Host(`local.domain.com`)
      middlewares:
        - redirecthttp@file
      service: local
    local-secure:
      entryPoints:
        - websecure
      tls: {}
      service: local

  services:
    local:
      loadBalancer:
        servers:
          - url: http://192.168.0.1:8000
```

On your local machine you would have a configuration something like this (container service):

```yml
http:
  routers:
    serviceName-reverse:
      rule: Host(`local.{{env "TUNNEL_URL"}}`) # TUNNEL_URL = domain.com
      entryPoints:
        - websecure
      middlewares:
        - pathstrip@file
      service: serviceName-{{env "COMPOSE_PROJECT_NAME"}}@docker
```

[pm2-manager]: https://pm2.keymetrics.io "PM2 daemon process manager"
[ngrok-site]: https://ngrok.com "Secure introspectable tunnels to localhost"
