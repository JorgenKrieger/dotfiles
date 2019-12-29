#!/bin/bash

Cloudflare=(
  1.1.1.1
  1.0.0.1
  2606:4700:4700::1111
  2606:4700:4700::1001
)

Google=(
  8.8.8.8
  8.8.4.4
  2001:4860:4860::8888
  2001:4860:4860::8844
)

OpenDNS=(
  208.67.222.222
  208.67.220.220
)

installer "Which DNS shall I set up?"
select DNS in Cloudflare Google OpenDNS; do
  eval NEW_DNS=\${$DNS[@]}
  networksetup -setdnsservers Wi-Fi $NEW_DNS
  action "Setting up $DNS"
  ok
  break
done
