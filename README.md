# Docker Containers for Local Development

[![HitCount][hits-count-img]][hits-count] [![Follow me on GitHub][github-follow-img]][github-profile] [![Follow me on Twitter][twitter-follow-img]][twitter-profile]

This repo contains docker containers I use mostly for JavaScript development but they can be used for just about anything. Below is a breakdown of how I make use of most of them. This should give you an idea of how I try to implement DevOps even on my local machine.

Firstly, here's a list of things you'll need (I may be biased towards Linux as I use Manjaro as my daily driver):

1. `docker` and `docker-compose` are necessary (After all, we are dealing with docker containers 🤷‍♂️)
2. A local DNS server such as `dnsmasq` (Optional)
3. An SSL certificate generator such as `mkcert` (Optional)

**Table of Contents**
---

- [Docker Containers for Local Development](#docker-containers-for-local-development)
  - [**Table of Contents**](#table-of-contents)
  - [Configuration](#configuration)
    - [Environment Variables](#environment-variables)
    - [Docker Compose File](#docker-compose-file)
    - [Networks External to Docker Compose Project](#networks-external-to-docker-compose-project)
  - [dnsmasq](#dnsmasq)
  - [mkcert](#mkcert)
    - [Usage in Mobile Development](#usage-in-mobile-development)
    - [Usage with Node.js](#usage-with-nodejs)
  - [Traefik](#traefik)
    - [Setting Up Traefik](#setting-up-traefik)
    - [Using Traefik to Proxy to Services](#using-traefik-to-proxy-to-services)
  - [Running A Service](#running-a-service)

## Configuration

### Environment Variables

Take time to go through the `.env.example` file to see a the default values and make your own copy according to your environment (dev or prod).

```bash
cp .env.example .env
```

### Docker Compose File

Copy the `docker-compose.example.yml` to `docker-compose.yml` file so that you have a good starting point for your containers. This file works hand in hand with the `.env` file so you might want to run through both and get an idea of how they both work.

```bash
cp docker-compose.example.yml docker-compose.yml
```

### Networks External to Docker Compose Project

This `docker-compose.yml` configuration makes use of two external to the compose project, namely, `dockernet` and `backdocker`. You'll have to create two docker networks. You can use any IP range you choose but keep in mind that you'll have to update IP addresses in the `docker-compose.yml` configuration. An example:

```bash
docker network create --subnet 192.168.90.0/24 --gateway 192.168.90.1 backdocker

docker network create --subnet 192.168.0.0/24 --gateway 192.168.0.1 dockernet
```

## dnsmasq

`dnsmasq` makes it easier to have services and projects running under an optional domain name on your local machines. It's pretty machine like having an automated `/etc/hosts` file. Once you have a domain set up, you don't need to worry about adding subdomains. You can read about how to set it up [here][dnsmasq-blog].

The domain I use for my local development is usually `local.test` as can be seen in my [`dnsmasq.conf` config file][dnsmasq-conf].

After completing the configurations, run the following commands:

```bash
  dnsmasq --test # to confirm the syntax of the config file

  sudo systemctl enable dnsmasq # to enable the dnsmasq service

  sudo systemctl start dnsmasq # to start the dnsmasq service (or restart if it was running before)
```

You may also need to make changes to your `resolvconf.conf` so that you are able to browse external websites. You can check out [this gist for an example][resolvconf-conf], but for brevity, the lines to change are shown below:

```conf

# Use the local name server
name_servers="127.0.0.1 1.1.1.1 8.8.8.8"

# Write out dnsmasq extended configuration and resolv files
dnsmasq_conf=/etc/dnsmasq-conf.conf
dnsmasq_resolv=/etc/dnsmasq-resolv.conf
```

After making said changes run the following command and restart the `dnsmasq` service:

```bash
sudo resolvconf -u # updates resolv subdirectories
```

And that's it, as long as you have a service running at port 80, the domain `local.test` will resolve to it without needing to touch your hosts file. For services running at other ports, keep reading! 😉

## mkcert

`mkcert` is an awesome tool I use for local SSL development. According to the developers of the tool:

> `mkcert` is a simple tool for making locally-trusted development certificates. It requires no configuration.

Installation, and instructions on setting up can be found on [this GitHub repository][mkcert-github].

I created a bash script to help with using `mkcert` once you have it installed for the sole purpose of creating SSL certificates. It's available in this repository [here][generate-sh]. The script itself is heavily commented and can be used to install and create a domain certificate all at once. I'd encourage you to get familiar with the script and ultimately read through the [`mkcert` repository][mkcert-github] documentation to have a thorough understanding of how to utilize this tool. I will, however, show you how I use it below.

```bash
mkcert -install # to create a new local CA
```

To create certificates that I'll use with my Traefik container, I run the following command from the root of this repository.

```bash
./traefik/certs/generate.sh "*.local.test"
```

The reason I use a wildcard domain is because of how I service names as subdomains. Using a wildcard certificate will allow the creation of one certificate for a number of subdomains.

### Usage in Mobile Development

When creating websites that should be mobile first, I like to have the experience of entering qualified domain names. But for me to implement SSL, and to have the certificates trusted on my mobile device(s), I have to have the root CA installed on my device(s) as well. It is the `rootCA.pem` file in the folder printer by the command `mkcert -CAROOT`. The developers of `mkcert` explained it rather well [in their documentation][mkcert-mobile]. In a nutshell:

> On iOS, you can either use AirDrop, email the CA to yourself, or serve it from an HTTP server. After installing it, you must enable full trust in it.
> For Android, you will have to install the CA and then enable user roots in the development build of your app.

### Usage with Node.js

[As explained by `mkcert` developers][mkcert-node], you will have to set the `NODE_EXTRA_CA_CERTS` environment variable. I have the following command appended to my `~/.bash_aliases` file so that it runs in every terminal:

```sh
export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"
```

Now, onto the best part, the [proxy server](#traefik)! 🤩

## Traefik

I use Traefik in development and production, as well. I find it easier to transition projects that way since the only difference between environments is just a configuration file. Additionally, I only ever have to expose port `80` or port `443` to the internet for any of the services I have, whether in production, or development.

### Setting Up Traefik

1. Within the [traefik folder](traefik), there is an `.env.example` file that will need to be copied to a `.env` file similar to the overall [configuration](#configuration) step. The only difference is that this `.env` is private to the Traefik container that will be created.
2. Depending on the environment, either the [`traefik.development.yaml`](traefik/traefik.development.yaml) or the [`traefik.production.yaml`](traefik/traefik.production.yaml) file will need to be copied to a `traefik.yaml` file. Of course, since we are looking at local development, we will go with the former. This is the configuration file for the Traefik container that will be created.

```bash
cp .env.example .env

cp traefik.development.yaml traefik.yaml
```

These are just starter defaults that can be customized to your whim. To get a better understanding of Traefik, you will do well to check their [documentation on their website][traefik-docs].

### Using Traefik to Proxy to Services

Now that Traefik is set up, you can point it to the many services, containerized or not, running on your local machine. The SSL certificates you created earlier are already in the right directory for the Traefik service to use them. Their is a more detailed explanation in the [`traefik` directory](traefik/README.md)

## Running A Service

To run a service, run the following command

```bash
docker-compose up -d serviceName
```

where the `serviceName` is the name of a service in the `docker-compose.yml` file under the `services` object.

<!-- Links -->
[dnsmasq-blog]: https://www.linux.com/training-tutorials/dnsmasq-easy-lan-name-services/ "How to set up dnsmasq"
[dnsmasq-conf]: https://gist.github.com/stctheproducer/3dd47aae53dd86081f946696c886fa39#file-dnsmasq-conf "A dnsmasq.conf file"
[resolvconf-conf]: https://gist.github.com/stctheproducer/3dd47aae53dd86081f946696c886fa39#file-resolvconf-conf "A resolvcon.conf file"
[mkcert-github]: https://github.com/FiloSottile/mkcert "The mkcert tool"
[generate-sh]: traefik/certs/generate.sh "Generate domain certificates"
[mkcert-mobile]: https://github.com/FiloSottile/mkcert#mobile-devices "Using mkcert in mobile development"
[mkcert-node]: https://github.com/FiloSottile/mkcert#using-the-root-with-nodejs "Using mkcert with NodeJS"
[traefik-docs]: https://docs.traefik.io "Traefik documentation"
[hits-count]: http://hits.dwyl.com/stctheproducer/docker-containers
[hits-count-img]: http://hits.dwyl.com/stctheproducer/docker-containers.svg
[github-profile]: https://github.com/stctheproducer
[github-follow-img]: https://img.shields.io/github/followers/stctheproducer?label=Follow&style=social
[twitter-profile]: https://twitter.com/stctheproducer
[twitter-follow-img]: https://img.shields.io/twitter/follow/stctheproducer?label=Follow&style=social
