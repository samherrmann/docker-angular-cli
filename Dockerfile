ARG NODE_VERSION=lts-alpine
FROM node:$NODE_VERSION

# Change ownership of the global node modules directory
# to allow installs without requiring sudo privileges.
#
# See: https://docs.npmjs.com/getting-started/fixing-npm-permissions
RUN chown -R node $(npm config get prefix)

# Install:
#   Chromium - For running unit tests
#   Git      - Used by the CLI when creating new projects
#   Bash     - Needed by webdriver-manager
USER root
RUN apk add --no-cache \
  bash \
  chromium \
  chromium-chromedriver \
  git

COPY .gitconfig .angular-config.json /home/node/

ENV CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium

# Install Angular CLI
ARG NG_CLI_VERSION
ARG NG_SCHEMATICS_VERSION
USER node
RUN npm install -g \
 @angular/cli@$NG_CLI_VERSION \
 @angular-devkit/schematics-cli@$NG_SCHEMATICS_VERSION

WORKDIR /code
ENTRYPOINT ["npm"]
