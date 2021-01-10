# Docker Containers for Local Development

This repo contains docker containers I use mostly for JavaScript development but they can be used for just about anything. Below is a breakdown of how I make use of most of them. This should give you an idea of how I try to implement DevOps even on my local machine.

Firstly, here's a list of things you'll need (I may be biased towards Linux as I use Manjaro as my daily driver):

1. A local DNS server such as `dnsmasq` (Optional)
2. An SSL certificate generator such as `mkcert` (Optional)
3. `docker` and `docker-compose` are necessary (hey, we are dealing with docker containers 🤭)

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

<!-- Links -->
[dnsmasq-blog]: https://www.linux.com/training-tutorials/dnsmasq-easy-lan-name-services/
[dnsmasq-conf]: https://gist.github.com/stctheproducer/3dd47aae53dd86081f946696c886fa39#file-dnsmasq-conf
[resolvconf-conf]: https://gist.github.com/stctheproducer/3dd47aae53dd86081f946696c886fa39#file-resolvconf-conf
