#!/usr/bin/env bash
# This is a sample script for using the container.

args=()
[[ $@ == 'start'* ]] && args+=('--publish 4200:4200')
[[ $@ == 'run test'* ]] && args+=('--publish 9876:9876')

docker run \
  -it \
  --rm \
  -v $(pwd):/code \
  ${args} \
  samherrmann/angular-cli:latest $@