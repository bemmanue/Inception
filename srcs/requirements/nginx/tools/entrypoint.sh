#!/bin/bash

# Path to store ssl certificates
certs=/etc/ssl/certs

# Create path if it does not exist
mkdir -p $certs

# Generate cerificates
openssl req -x509							\
	-sha256								\
	-nodes								\
	-days 365							\
	-subj "/C=RU/ST=Tatarstan/L=Kazan/O=School21/CN=localhost"	\
	-newkey rsa:2048						\
	-keyout $certs/$DOMAIN_NAME.key					\
	-out $certs/$DOMAIN_NAME.crt

exec "$@"
