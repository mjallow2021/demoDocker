### Start Docker
```docker --version```
### Check if any containers are running
```docker ps ```
### Check for all containers both running and stopped
```docker ps -a```
### Check the container images we have
```docker images ```
### Navigate to your folder
#### The code below will build docker image
```docker build -t simplesite .```
### After successful build check out your image
```docker images```
#### our new container should now be listed

### Run your image make it a container
```docker run mysimple -d -p 8080:80 --image=simplesite``` 
### After successful run check the container
```docker ps -a```
### Once you see your container is working
##### Test from CLI
```curl -I localhost:8080```
#### The above should give you a 200 code / status headers
```curl localhost:8080```
### The above should give you the html code
To see your site, open your browers and navigate to: 
```http://localhost:8080 ```
