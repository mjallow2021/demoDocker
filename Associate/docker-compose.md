This is an attempt at explaining how Docker commands on the CLI can be turned into a Docker-Compose file.
Docker-compose is the usual way of running containers in a prod environment.

It does come bundles with docker,  but if its not you can install it using
`sudo apt install docker-compose` for ubuntu.

After the install check the version
`docker-compose --version` 

If its installed, it will display version number

The docker compose file is usually called that name, but can be given any other name, and can be in YAML or JSON.

Previously we ran our app using 2 containers by running the following commands. 
```
docker run --name springapp -d -p4000:8080 --network tesla 
-e MONGO_DB_USERNAME=devdb -e MONGO_DB_PASSWORD=dev@123 
-e MONGO_DB_HOSTNAME=mongo 
mylandmarktech/spring-boot-mongo

docker run --name mongo -d --network tesla \
-e MONGO_INITDB_ROOT_PASSWORD=dev@123 \
-eMONGO_INITDB_ROOT_USERNAME=devdb
-v /home/ubuntu/db:/data/db
mongo

```

The docker-compose file is written in YAML format and has this basic structure:
``` yaml
version: '3' # just the version number of docker compose
services: # list the services you gonna create
  service_name:  # start the name of your service and its configs
    image: image_name # we using the mongo image (use any that you need)
    ports: # list you ports under here (its a list so you use a dash)
      - 8080:80 # same as on the CLI host port then container port
    environment: # list your environment variables here
      - MONGO_INITDB_ROOT_USERNAME=admin   # these are picked from the documentation of the container
      - MONGO_INITDB_ROOT_PASSWORD=password
    volumes: # list of volumes you want to attach it can be more than one
      - /home/ubuntu/db:/data/db # host path/folder to container/path/folder

```

The 2 commands above have now been added into a single docker-compose file below ready to deploy.
*Note:* There is no network added as docker will add them automatcally into their own network  

``` yaml
version: '3'
services:
# Configs for the springapp starts here
  springapp:
    image: mylandmarktech/spring-boot-mongo
    ports:
      - 4000:8080
    environment:
      - MONGO_DB_ROOT_USERNAME=devdb
      - MONGO_DB_ROOT_PASSWORD=dev@123
      - MONGO_DB_HOSTNAME=mongo
# configs for the mongodb starts below
  mongo:
    image: mongo
    ports:
      - 27017:27017
    environment:
      - MONGO_INITDB_ROOT_USERNAME=devdb
      - MONGO_INITDB_ROOT_PASSWORD=dev@123
    volumes:
      - db-data:/data/db

```
  
Save the above code with a `.yml or .yaml` extension, like so `docker-compose.yml`

To run it, enter the command below
```
docker-compose dockercompose.yml up
```
