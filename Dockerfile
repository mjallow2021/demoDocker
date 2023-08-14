#This get the latest nginx alpine a small and fast docker image 
FROM nginx:alpine
# We get any updates necessary
RUN apk update 
# We copy all the files in the current directory (signified by the dot)
COPY . /usr/local/nginx/html
