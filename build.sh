# stop all (running) containers
docker stop $(docker ps -a -q)
# build docker container for predictionio 
docker build -t pio .
# run docker container
docker run -it -p 7070:7070 -p 8080:8080 -p 9000:9000 pio bash
# start eventserver
# pio eventserver &
