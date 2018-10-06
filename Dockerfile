FROM node:8-alpine

# Change ownership of the global node modules directory
# to allow installs without requiring sudo privileges.
#
# See: https://docs.npmjs.com/getting-started/fixing-npm-permissions
RUN chown -R node $(npm config get prefix)

# Install Chromium
ARG CHROMIUM_VERSION
USER root
RUN apk add --no-cache \
  --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
  chromium=$CHROMIUM_VERSION \
  chromium-chromedriver=$CHROMIUM_VERSION
ENV CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium

# Install Angular CLI
ARG NG_CLI_VERSION
USER node
RUN npm install -g @angular/cli@$NG_CLI_VERSION

WORKDIR /code
ENTRYPOINT ["npm"]
