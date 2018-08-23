NG_CLI_VERSION="6.1.4"
CHROME_VERSION="65.0.3325.181-1"

docker build \
  --build-arg NG_CLI_VERSION=$NG_CLI_VERSION \
  --build-arg CHROME_VERSION=$CHROME_VERSION \
  -t samherrmann/angular-cli .

docker tag samherrmann/angular-cli samherrmann/angular-cli:$NG_CLI_VERSION