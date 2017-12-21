FROM node:carbon

ARG NG_CLI_VERSION

# Change ownership of the global node modules directory
# to allow installs without requiring sudo privileges.
RUN ["bash", "-c", "chown -R node $(npm config get prefix)/{lib/node_modules,bin,share}"]

# Install Angular CLI.
USER node
RUN npm install -g @angular/cli@$NG_CLI_VERSION

WORKDIR /code
ENTRYPOINT ["ng"]