This is an attempt at explaining how Docker commands on the CLI can be turned into a Docker-Compose file.
Docker-compose is the usual way of running containers in a prod environment.

It does come bundles with docker,  but if its not you can install it using
`sudo apt install docker-compose` for ubuntu.

After the install check the version
`docker-compose --version` 

If its installed, it will display version number or run
To get more info about commands 
`docker-compose --version`

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
  
YAML flies end a `.yml or .yaml` extension, like so `docker-compose.yml`

To your docker compose file, enter the command below
```
docker-compose up
```
The containers generated from your file will be name in the following format:
folder_servicename_no  
If you specify a container name, it will be containername_no 


If you save it with a different name eg `testcompose.yml`
your command should be 
`docker-compose -f testcompose.yml up`

To run it in detached mode, add the `-d` flag

To stop your containers 
`docker-compose -f testcompose.yml down`

To check if your docker compose file is correct
`docker-compose -f testcompose.yml config`

To get more info about commands 
`docker-compose --help`




Docker-compose file below
```yaml
#Same file with networks and exteral volumes defined.
version: '3.8'
services:
  webapp:
    image: mylandmarktech/spring-boot-mongo
#    restart: always
    ports:
      - 3000:8080
    networks:
      - tesla
    environment:
      - MONGO_DB_HOSTNAME=mongodb
      - MONGO_DB_USERNAME=devdb
      - MONGO_DB_PASSWORD=dev@123
  mongodb:
       image: mongo
 #      restart: always
       volumes:
         - db-data:/data/db
       networks:
         - tesla
       environment:
         - MONGO_INITDB_ROOT_USERNAME=devdb
         - MONGO_INITDB_ROOT_PASSWORD=dev@123
volumes:
   db-data:
     external: false
networks:
  tesla:
    external: true
```
