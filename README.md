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

## Development
### Build Image
* Run `./build.sh`