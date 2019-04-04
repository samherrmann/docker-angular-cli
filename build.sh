NG_CLI_VERSION="7.3.2"
NG_SCHEMATICS_VERSION="0.13.8"
CHROMIUM_VERSION="72.0.3626.121-r0"

docker build \
  --build-arg NG_CLI_VERSION=$NG_CLI_VERSION \
  --build-arg CHROMIUM_VERSION=$CHROMIUM_VERSION \
  -t samherrmann/angular-cli .

docker tag samherrmann/angular-cli samherrmann/angular-cli:$NG_CLI_VERSION
