# stop all (running) containers
docker stop $(docker ps -a -q)
# build docker container for predictionio 
docker build -t pio .
# run docker container

