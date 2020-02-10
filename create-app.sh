docker run \
  -it \
  --rm \
  -v $(pwd):/code \
  -e HTTP_PROXY=$HTTP_PROXY \
  -e HTTPS_PROXY=$HTTPS_PROXY \
  -e NO_PROXY=$NO_PROXY \
  --entrypoint ng \
  samherrmann/angular-cli:latest new my-app