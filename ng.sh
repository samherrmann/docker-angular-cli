# This is a sample script to run the container.

args=()
[[ $1 == 'serve' ]] && args+=('--publish 4200:4200')

docker run \
  -it \
  --rm \
  -v $(pwd):/code \
  ${args} \
  samherrmann/angular-cli $@