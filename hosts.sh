#!/bin/bash

cat /etc/hosts | while read ip name etc; do
    if [[ -z "$ip" || "$ip" == \#* ]]; then
        continue
    fi
    if [[ "$name" == "localhost" || "$name" == "teo-VirtualBox" || "$name" == ip6-* ]]; then
        continue
    fi
    if ! nslookup "$name" 8.8.8.8 | grep -q "Address: $ip"; then
        echo "Bogus IP for $name in /etc/hosts!"
    fi
done
