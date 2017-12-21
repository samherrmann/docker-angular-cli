# Angular CLI
A Docker image for [Angular CLI](https://github.com/angular/angular-cli).

## Usage
```sh
docker run -it --rm -v $(pwd):/code samherrmann/angular-cli new my-app
cd my-app

# Add a helper script to the project to run the container.
echo 'docker run -it --rm -v $(pwd):/code samherrmann/angular-cli $@' > ng.sh
chmod +x ng.sh

# From now on you can just type...
./ng g module foo
./ng g component foo
```

### npm
Since this image is derived from the official node image, it is possible to use this image to also run `npm` commands. Simply create an `npm.sh` script that uses Docker's `--entrypoint` option to run `npm` instead of the CLI:
```sh
echo 'docker run -it --rm --entrypoint npm -v $(pwd):/code samherrmann/angular-cli $@' > npm.sh
chmod +x npm.sh

# From now on you can just type...
./npm install <my-new-lib>
```

## Development
### Build Image
* Run `./build.sh`
