#!/usr/bin/env bash
# This is a sample script for using the container.

args=()
[[ $@ == 'start'* || $@ == 'run start'* ]] && args+=('--publish 4200:4200')
[[ $@ == 'test'* || $@ == 'run test'* ]] && args+=('--publish 9876:9876')
[[ $@ == 'run e2e'* ]] && args+=('--publish 49152:49152')

docker run \
  -it \
  --rm \
  -v $(pwd):/code \
  ${args} \
  samherrmann/angular-cli:latest $@

#################################################
# Options
#################################################
# Proxy Settings:
#   -e http_proxy=192.168.0.1 \
#   -e https_proxy=192.168.0.1 \
#   -e no_proxy=localhost,127.0.0.1,0.0.0.0,::1 \
##################################################