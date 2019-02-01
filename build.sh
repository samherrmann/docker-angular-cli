NG_CLI_VERSION="7.3.0"
CHROMIUM_VERSION="71.0.3578.98-r2"

docker build \
  --build-arg NG_CLI_VERSION=$NG_CLI_VERSION \
  --build-arg CHROMIUM_VERSION=$CHROMIUM_VERSION \
  -t samherrmann/angular-cli .

docker tag samherrmann/angular-cli samherrmann/angular-cli:$NG_CLI_VERSION
