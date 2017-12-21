# This is a sample script for using the container to run npm commands.
docker run -it --rm --entrypoint npm -v $(pwd):/code samherrmann/angular-cli $@