/usr/bin/env bash
# This script is created to create ssl keys and pem files using different keysizes
# Author:
# version:
KEYNAME=(rsa ecdsa dsa ecdh)
KEYSIZE=(1024 2048 4096)

for keyname in "${KEYNAME[@]}"
do
  for keysize in "${KEYSIZE[@]}"
  do
    echo "Creating ${keyname} pem file using ${keysize}..."
    openssl req -x509 -sha256 -nodes \
    -subj "/C=US/ST=Pennsylvania/L=Malvern/O=test Corp/CN=10.151.6.227.cct0.vanguard.com" \
    -days 365 \
    -newkey ${keyname}:{keysize} \
    -keyout  /cm/keys/${KEYNAME}-${KEYSIZE}.key \
    -out /cm/keys/${KEYNAME}-${KEYSIZE}.pem
  done
  echo "${KEYNAME}-${KEYSIZE}.key and ${KEYNAME}-${KEYSIZE}.pem created in /cm/keys directory."
  sleep 2
done
