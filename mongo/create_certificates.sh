#!/bin/bash

# * Create a crt and key file
openssl req -newkey rsa:2048 -new -x509 -days 365 -nodes -out mongodb-cert.crt -keyout mongodb-cert.key

# * concat both files to get a pem file
cat mongodb-cert.key mongodb-cert.crt > mongodb.pem