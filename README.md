# energy-grid-api-docker
Deployd JS architecture for docker 

//This should pull the docker image, start it on port 80

docker run -it -p 80:2403 neogucky/energy-grid-api-docker:latest /bin/bash updateAndStart.sh

//Debug: (should start container and then automatically connect to it)
docker run -it -p 80:2403 neogucky/energy-grid-api-docker:latest /bin/bash updateAndStart.sh

Connect on localhost:
localhost/alarm.html
localhost/generator.html
