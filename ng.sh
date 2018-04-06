# This is a sample script to run the container.

args=()
[[ $@ == 'serve'* ]] && args+=('--publish 4200:4200')
[[ $@ == 'run test'* ]] && args+=('--publish 9876:9876')

docker run \
  -it \
  --rm \
  -v $(pwd):/code \
  ${args} \
  samherrmann/angular-cli:latest $@