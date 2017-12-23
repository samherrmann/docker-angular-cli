NG_CLI_VERSION=1.6.2

docker build \
  --build-arg NG_CLI_VERSION=$NG_CLI_VERSION \
  -t samherrmann/angular-cli .

docker tag samherrmann/angular-cli samherrmann/angular-cli:$NG_CLI_VERSION