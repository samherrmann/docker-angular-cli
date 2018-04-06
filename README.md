# Angular CLI
A Docker image for [Angular CLI](https://github.com/angular/angular-cli).

## Usage
1. Create a new Angular CLI project:
    ```sh
    docker run -it --rm -v $(pwd):/code samherrmann/angular-cli new my-app
    ```

2. Copy the [npm.sh](npm.sh) script into your project's root directory.

3. Use the script to execute Angular CLI commands:
    ```sh
    ./npm.sh run ng g m my-module
    ```
    ```sh
    ./npm.sh run ng g c my-module/my-component
    ```

    The script can also be used to execute `npm` commands:
    ```sh
    ./npm.sh install <my-new-lib>
    ```
    ```sh
    ./npm.sh start
    ```
    ```sh
    ./npm.sh run lint
    ```

### Testing
Add the following configuration to your `karma.conf.js` to be able to leverage
Google Chrome in the container for unit testing:

```js
browsers: ['customChrome'],
customLaunchers: {
  customChrome: {
    base: 'ChromeHeadless',
    flags: [
      '--no-sandbox'
    ]
  }
}
```

Now unit tests can be executed with the following command:
```sh
./npm.sh run test
```
Test progress and results can be viewed either in the terminal or in a browser at
`localhost:9876`, where `9876` is the port configured in `karma.conf.js`.

### Production Projects
For production projects, I recommend the following:

* Change the `latest` version tag inside the `npm.sh` script to the actual version
of the image (Example: Replace `latest` with `1.6.2`).
* Check the `npm.sh` script into version control.

Following these recommendations ensures that the builds are reproducible by
always using the same version of the build tools for a given codebase version.

## Development
### Build Image
Run the `./build.sh` script to build an image.
