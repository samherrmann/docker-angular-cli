# This is a sample script for using the container to run npm commands.

args=()
[[ $@ == 'start' ]] && args+=('--publish 4200:4200')

docker run \
  -it \
  --rm \
  -v $(pwd):/code \
  ${args} \
  --entrypoint npm \
  samherrmann/angular-cli $@