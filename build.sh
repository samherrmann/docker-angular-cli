source env.sh

docker build \
  --build-arg NG_CLI_VERSION=$NG_CLI_VERSION \
  --build-arg CHROMIUM_VERSION=$CHROMIUM_VERSION \
  --build-arg HTTP_PROXY=$HTTP_PROXY \
  --build-arg HTTPS_PROXY=$HTTPS_PROXY \
  --build-arg NO_PROXY=$NO_PROXY \
  -t samherrmann/angular-cli .

docker tag samherrmann/angular-cli samherrmann/angular-cli:$NG_CLI_VERSION
