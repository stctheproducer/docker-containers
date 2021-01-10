# Docker Containers for Local Development

This repo contains docker containers I use mostly for JavaScript development but they can be used for just about anything. Below is a breakdown of how I make use of most of them. This should give you an idea of how I try to implement DevOps even on my local machine.

Firstly, here's a list of things you'll need (I may be biased towards Linux as I use Manjaro as my daily driver):

1. A local DNS server such as `dnsmasq` (Optional)
2. An SSL certificate generator such as `mkcert` (Optional)
3. `docker` and `docker-compose` are necessary (hey, we are dealing with docker containers 🤭)

Table of Contents

---

- [Docker Containers for Local Development](#docker-containers-for-local-development)
  - [dnsmasq](#dnsmasq)
  - [mkcert](#mkcert)
    - [Usage in Mobile Development](#usage-in-mobile-development)
    - [Usage with Node.js](#usage-with-nodejs)
  - [Traefik](#traefik)

## dnsmasq

`dnsmasq` makes it easier to have services and projects running under an optional domain name on your local machines. It's pretty machine like having an automated `/etc/hosts` file. Once you have a domain set up, you don't need to worry about adding subdomains. You can read about how to set it up [here][dnsmasq-blog].

The domain I use for my local development is usually `local.test` as can be seen in my [`dnsmasq.conf` config file][dnsmasq-conf].

After completng the configurations, run the following commands:

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

And that's it, as long as you have a service running at port 80, the domain `local.test` will resolve to it without needing to touch your hosts file. For services running at other ports, keep reading 😉

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

The reason I use a wildcard domain is explained the [following section](#wildcard-domains).

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

<!-- Links -->
[dnsmasq-blog]: https://www.linux.com/training-tutorials/dnsmasq-easy-lan-name-services/
[dnsmasq-conf]: https://gist.github.com/stctheproducer/3dd47aae53dd86081f946696c886fa39#file-dnsmasq-conf
[resolvconf-conf]: https://gist.github.com/stctheproducer/3dd47aae53dd86081f946696c886fa39#file-resolvconf-conf
[mkcert-github]: https://github.com/FiloSottile/mkcert
[generate-sh]: traefik/certs/generate.sh
[mkcert-mobile]: https://github.com/FiloSottile/mkcert#mobile-devices
[mkcert-node]: https://github.com/FiloSottile/mkcert#using-the-root-with-nodejs
