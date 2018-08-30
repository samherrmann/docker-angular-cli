FROM node:carbon

# Change ownership of the global node modules directory
# to allow installs without requiring sudo privileges.
#
# See: https://docs.npmjs.com/getting-started/fixing-npm-permissions
RUN ["bash", "-c", "chown -R node $(npm config get prefix)/{lib/node_modules,bin,share}"]

# Install Google Chrome to support testing
# See: https://www.ubuntuupdates.org/ppa/google_chrome?dist=stable
ARG CHROME_VERSION
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list && \
    apt-get -qqy update && \
    apt-get -qqy install google-chrome-stable=$CHROME_VERSION

# Install Angular CLI
ARG NG_CLI_VERSION
USER node
RUN npm install -g @angular/cli@$NG_CLI_VERSION

WORKDIR /code
ENTRYPOINT ["npm"]