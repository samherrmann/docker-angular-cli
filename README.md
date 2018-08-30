# Angular CLI
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

3. Add the following configuration to `angular-cli.json` to make the app
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
        base: 'ChromeHeadless',
        flags: ['--headless', '--no-sandbox']
      }
    }
    ```

5. Modify `protractor.conf.js` to use headless Chrome:

    ```js
    capabilities: {
    'browserName': 'chrome',
      chromeOptions: {
        args: ['--headless', '--no-sandbox']
      }
    }
    ```

6. Modify the `e2e` script in `package.json`to run e2e tests without updating drivers:

    ```json
    "e2e": "ng e2e --webdriver-update=false",
    "postinstall": "npm run webdriver-manager update -- --versions.standalone=2.53.1 --versions.chrome=2.38 --versions.gecko=v0.13.0",
    "webdriver-manager": "npm explore protractor -- webdriver-manager"
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
### Build Image
Run the `./build.sh` script to build an image.

### Publish Image
Run the `./publish.sh` script to push an image to Docker Hub.
