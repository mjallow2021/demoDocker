The are a few thing you need to create before you start
Create the network:
```
docker network create tesla
```
Create the volume to save your data
```
docker volume create db-data
```
Run the springboot container

```
docker run --name springapp -d -p4000:8080 --network tesla \
-e MONGO_DB_USERNAME=devdb -e MONGO_DB_PASSWORD=dev@123 
-e MONGO_DB_HOSTNAME=mongo 
mylandmarktech/spring-boot-mongo  
```

Run the mongo db container
```
docker run --name mongo -d --network tesla \
-e MONGO_INITDB_ROOT_PASSWORD=dev@123 \
-eMONGO_INITDB_ROOT_USERNAME=devdb
-v /home/ubuntu/db:/data/db
mongo
```
To see the app visit on your device
http://127.0.0.1:4000 

Enter a bunch of fake data and see it populate at the bottom

If we launch a new front end and attach it to the same network, we'd see the same thing.



