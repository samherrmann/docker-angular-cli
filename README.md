# Angular CLI

> :warning: This project is deprecated. Consider using the [Visual Studio Code
> Remote - Containers](https://code.visualstudio.com/docs/remote/containers)
> extension instead. See
> [angular-sandbox](https://github.com/samherrmann/angular-sandbox) for an
> example Angular CLI project that uses the Remote - Containers extension.

A Docker image for running [Angular CLI](https://github.com/angular/angular-cli)
in a container.
## Benefits
* Eliminate the need to manually confirm that you are running a version of
  Node.js/npm that is compatible with your version of Angular CLI.
* Ensure that all developers are running the same version of the build tools.
* Ensure that the build machine is running the same version of the build tools
  as the developers.
* Make switching between projects with different versions of the build tools
  transparent to the developers.
* Ensure that builds are reproducible.

## Usage
### One-Time Setup
1. Create a new Angular CLI project:
    ```sh
    docker run -it --rm -v $(pwd):/code --entrypoint ng samherrmann/angular-cli new my-app
    ```

2. Copy the [npm.sh](npm.sh) script into your project's root directory.
    * Change the `latest` version tag inside the `npm.sh` script to the actual
      version of the image (Ex: Replace `latest` with `1.6.2`).
    * Commit it to your version control system.

3. Add the following configuration to `angular.json` to make the app
   accessible from the browser on the host machine:
    ```json
      "defaults": {
        "serve": {
          "host": "0.0.0.0"
        }
      }
    ```
4. Modify `karma.conf.js` to use headless Chrome:

    ```js
    browsers: ['customChrome'],
    customLaunchers: {
      customChrome: {
        base: 'ChromiumHeadless',
        flags: ['--headless', '--no-sandbox']
      }
    }
    ```

5. Modify `protractor.conf.js` to use headless Chrome:

    ```js
    chromeDriver: '/usr/bin/chromedriver',
    capabilities: {
      browserName: 'chrome',
      chromeOptions: {
        args: ['--headless', '--no-sandbox']
      }
    }
    ```

6. Modify the `e2e` script in `package.json`to run e2e tests without updating drivers:

    ```json
    "e2e": "ng e2e --webdriver-update=false"
    ```

### Development Workflow
Execute Angular CLI commands:

```sh
./npm.sh run ng g m my-module
```
```sh
./npm.sh run ng g c my-module/my-component
```

Execute `npm` commands:
```sh
./npm.sh install <my-new-lib>
```
```sh
./npm.sh start
```
```sh
./npm.sh run lint
```
```sh
./npm.sh run test
```
```sh
./npm.sh run e2e
```

## Development
This project uses Docker Hub to build and publish images. Changes made to this
repository are built by Docker Hub's automated build system and published as
follows:

| Git              | Docker Image                     |
| ---------------- | -------------------------------- |
| `master` branch  | `samherrmann/angular-cli:latest` |
| `v1.2.3` tag     | `samherrmann/angular-cli:v1.2.3` |

See the `hooks` directory for Docker Hub automated build configurations.

### Updating Image

1. Check available versions from resources listed below
1. Change version tags as desired in `hooks/build`
1. Commit changes and tag commit with version of Angular CLI (e.g. `v1.2.3`)
1. Push commit to GitHub with `git push && git push --tags`
1. Verify new image is published on [Docker Hub](https://hub.docker.com/r/samherrmann/angular-cli/tags)

### Available Versions
* [Node.js](https://hub.docker.com/_/node)
* [@angular/cli](https://www.npmjs.com/package/@angular/cli)
* [@angular-devkit/schematics-cli](https://www.npmjs.com/package/@angular-devkit/schematics-cli)