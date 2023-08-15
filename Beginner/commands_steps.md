A list of important Docker commands to know and use in 

To see the running containers run
```
docker ps
```

To see only running container IDs only
```
docker ps –a​q
```

To filter the results to a specfic state
```
docker ps –a​q --filter "stopped" 
```

To see the logs of a container (running or stopped)
```
docker logs <containername/id>
```
 ​
To see the history of the container.  the different layers.
```
docker history <container name / id>
```

To gain detailed info about a container
```
docker inspect <container name / id >
```
​

To go into the container and run commands 
```
docker exec -it <container name/id> sh
```
 ​

To run a container and automatically delete when it finishes
```
docker run ​-d -rm <container name / id>   
```

To create a network, run the command below. Note the default is bridge
```
docker network create backend 
```

To change to another  network mode use the ```-d=mode``` to set it.
```
docker network create backend -d bridge --internal hostonly 
```

To run a command on multiple line on the CLI use the backslashes for visibility and easy reading.
```
docker run --name my-mysql \
-e MYSQL_ROOT_PASSWORD=secret \
-v $HOME/mysql-data:/ var /lib/mysql \
-d mysql: 8.0
```

Envronment variable: These are variable which are set as part of a program or OS, required by the container to run.  They are usually things
like Username, Password, Secret, Path to required files etc.   They are usually preceded by the -e and capitalised.
It is not good practive to keep these values such as passwords in plain text or even saved in here.  This is for demo purposes only. 

To create a volume in Docker, run the command below:
```
docker volume create <volume_name>
```
Docker automatically creates a directory for the volume on the host under the path
`/var/lib/docker/volume/ `
Mount containers to this volume to ensure data persistence and data sharing among multiple containers.


