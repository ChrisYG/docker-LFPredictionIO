# docker-LFPredictionIO

This is a docker container for LF_PredictionIO so our predictive server can be used on AWS.

Directions:

Dockerfile is the file used to build docker image, and it includes information about source code, dependencies, packages, settings, etc., needed to build the image.

Run shell scripts in the following order (note that if you're in Windows, make sure you're using some third-party tool like Cygwin that supports the execution of .sh files, since Windows doesn't natively support them - use 'sh xxx.sh' in this case):

./build.sh will stop all running containers and build the dockerfile.

./run_parameters.sh will run the docker image, starting up a container in bash, with ports 7070, 8080, and 9000 open.

Then cd to the PredictionIO directory, first run ./build_base_engine.sh, then run 'pio eventserver &'.

Note that PredictionIO by default is installed in at '/'. Make sure to change the environment variables if path is changed, otherwise pio command won't be recognized.


