## Swarm Initition
To start the swarm and allow other nodes to join, run the command below

```
docker swarm init
```
The above command will generate a token like this:
```

To add a worker to this swarm, run the following command:

    docker swarm join \
    --token SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-1awxwuwd3z9j1z3puu7rcgdbx \
    172.17.0.2:2377
docker swarm join-token manager

To add a manager to this swarm, run the following command:

    docker swarm join \
    --token SWMTKN-1-3pu6hszjas19xyp7ghgosyx9k8atbfcr8p2is99znpy26u2lkl-7p73s1dx5in4tatdymyhg9hu2 \
    172.17.0.2:2377
```
Copy token generated to the worker node and run it.
You might need to escalate privileges to `root` for it to work.


### Nodes
To check you nodes:
```
docker node ls
```

To leave the swarm 
```
docker swarm leave 
```
If finding it difficlut to leave, you can use the `--force` or `-f`  option.

Remove a Node
```
docker node rm --force [node_number]
```

### Networking
Docker swarm has its own type of network called __overlay__
Once the swarm is initiated, a default network is created.   To create your own run the follwoing command 
```
docker network create [netowrkname]  --driver overlay
```
To check if its there
```
docker netowrk ls
```
This will then be availabe to use in your deployments.

### Deploying Stacks
The containers deployed with swarm are called stacks, which need to be name.  The command below deploys a stack called `webapp`
```
docker stack deploy -f swarm-compose.yml webapp
```

The containers deployed with swarm are called stacks, which need to be name.  The command below deploys a stack called `webapp`
```
docker stack deploy -f swarm-compose.yml webapp
```

To see the services in the stack, run
```
docker stack ls
```

To create a service called `myapp`
```
docker service create --name myapp -p 8080:80 --mode=global nginx:alpine
```

to list the services, run
```
docker service ls
```

To scale a service, run
```
docker service scale [service_number]=[number]
```
Higher number to scale up, and lower number to scale down

To stop and delete the service
```
docker stack rm [stackname]
```


__This is only an introduction to Swarm, there are manay more options and capabilities which can be explored.  __

