# Configurations

## Proxy Network

Make sure the proxy network is created as it is needed fro Traefik. Run the command:

```bash
docker network create --internal proxy
```

## Basic Web Authentication

To create a secure web authentication password use the `htpasswd` command. On Ubuntu, it can be installed using the following command.

```bash
sudo apt-get install apache2-utils
```

On Arch Linux, to get just the `htpasswd` program, run the following commands in succession:

```bash
sudo pacman -S apache

sudo cp /usr/bin/htpasswd /usr/local/bin/htpasswd

sudo pacman -Rncs apache
```

**Note:** all dollar signs in the hash need to be doubled for escaping.

To create user:password pair, it's possible to use this command:

```bash
echo $(htpasswd -nb user password) | sed -e s/\\$/\\$\\$/g

# user:$$apr1$$XreceAun$$aWg8Y/AUo0CJDeFixyRuT0
```

**Note:** in a kubernetes secret the string (e.g. generated by htpasswd) must be base64-encoded first. To create an encoded user:password pair, the following command can be used:

```bash
htpasswd -nb user password | openssl base64
```

Totally unrelated but, you can generate random strings by running the command:

```bash
openssl rand -base64 12

# +iemAiIxER8u1/CG8DuSl98WdM/T6l+uaw==
```