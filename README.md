# Angular CLI
A Docker image for [Angular CLI](https://github.com/angular/angular-cli).

## Usage
1. Create a new Angular CLI project:
```sh
docker run -it --rm -v $(pwd):/code samherrmann/angular-cli new my-app
```
2. Copy the [ng.sh](ng.sh) script into your project's root directory.

3. Use the script to execute Angular CLI commands:
```sh
./ng.sh g module my-module
```
```sh
./ng.sh g component my-component
```

### npm
Since this image is derived from the official node image, it is possible to
use this image to also run `npm` commands:

1. Copy the [npm.sh](npm.sh) script into your project's root directory.
2. Use the script to execute `npm` commands:
```sh
./npm.sh install <my-new-lib>
```
```sh
./npm.sh start
```
```sh
./npm.sh run lint
```

### Production Projects
For production projects, I recommend the following:

* Change the `latest` version tag inside the `ng.sh` and `npm.sh` script to
the actual version of the image (Example: Replace `latest` with `1.6.2`).
* Check the `ng.sh` and `npm.sh` script into version control.

Following these recommendations ensures that the builds are reproducible by
always using the same version of the build tools for a given codebase version.

## Development
### Build Image
Run the `./build.sh` script to build an image.
