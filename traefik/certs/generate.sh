#!/bin/bash
# Change to directory of script
cd "$(dirname "$0")"

if [ "$#" -ne 1 ]
then
  echo "Usage: Must supply a domain"
  exit 1
fi

DOMAIN=$1

# * On Linux, first install certutil.
# sudo apt install libnss3-tools
    # * -or-
# sudo yum install nss-tools
    # * -or-
# sudo pacman -S nss
    # * -or-
# sudo zypper install mozilla-nss-tools

# * Then you can install using Linuxbrew
# brew install mkcert

# * or build from source (requires Go 1.13+)
# git clone https://github.com/FiloSottile/mkcert && cd mkcert
# go build -ldflags "-X main.Version=$(git describe --tags)"

# * or use the pre-built binaries.
# * For Arch Linux users, mkcert is available on the official Arch Linux repository.
# sudo pacman -Syu mkcert

# * mkcert [list of domains]
# mkcert www.mydomain.local www.mydomain2.local test.mydomain.local
# mkcert "*.mydomain.local"

# * Create a local CA
# ! Warning: the rootCA-key.pem file that mkcert automatically generates gives complete
# ! power to intercept secure requests from your machine. Do not share it.
# mkcert -install

# ? For the certificates to be trusted on mobile devices, you will have to install the root
# ? CA. It's the rootCA.pem file in the folder printed by mkcert -CAROOT.
# ?
# ? On iOS, you can either use AirDrop, email the CA to yourself, or serve it from an HTTP
# ? server. After installing it, you must enable full trust in it. Note: earlier versions
# ? of mkcert ran into an iOS bug, if you can't see the root in "Certificate Trust Settings"
# ? you might have to update mkcert and regenerate the root.
# ?
# ? For Android, you will have to install the CA and then enable user roots in the development
# ? build of your app.

# * Using with NodeJS
# export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"

# * ADVANCED OPTIONS
# * -cert-file FILE, -key-file FILE, -p12-file FILE
#	*    Customize the output paths.

# *	-client
# *	   Generate a certificate for client authentication.
# *
# *	-ecdsa
# *	   Generate a certificate with an ECDSA key.
# *
# *	-pkcs12
# *	   Generate a ".p12" PKCS #12 file, also know as a ".pfx" file,
# *	   containing certificate and key for legacy applications.
# *
# *	-csr CSR
# *	   Generate a certificate based on the supplied CSR. Conflicts with
# *	   all other flags and arguments except -install and -cert-file.
# *
# *    Note: You must place these options before the domain names list.

# mkcert -key-file key.pem -cert-file cert.pem example.com *.example.com


# * mkcert automatically generates an S/MIME certificate if one of the supplied names is an
# * email address.
# mkcert filippo@example.com

# * Generate certificates
mkcert $DOMAIN

# * Generate certificates with options
# mkcert -key-file $DOMAIN.key -cert-file $DOMAIN.pem $DOMAIN
