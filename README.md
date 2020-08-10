# Sample Terraform Deployment
**How to run Dockerfile and build the Image ?**
1. Go to the folder **/Dockerfiles** in the repository.
2. Copy the Dockerfile and paste it to the root directory of the application folder.
3. Run the command 
```
$ docker build -t <IMAGE_NAME>:<TAG> .
```
This will build the Dockerfile and create an Docker Image of it. If the **<TAG>** is not mentioned, it will take it as **latest** by default. To see the list of build images, run the command 
```
$ docker images OR $ docker image ls
``` 
4. To run the Docker Image, hit the command
```
$ docker container run --name=<NAME> -p <PORT_TO_EXPOSE>:<PORT_TO_MAP> <IMAGE_NAME>:<TAG>

Example:
$ docker container run --name=web -p 5000:80 alpine:3.9
```


## Pushing Images to Google Container Registry (GCR)
Steps to push the image to GCR
**Step 1: Tag the image with the container registry location.**
```
$ docker tag <IMAGE_ID> us.gcr.io/searchpoc-284614/<IMAGE_NAME>:<TAG>
```

**Step 2: Push the image to GCR**
```
$ gcloud docker -- push us.gcr.io/searchpoc-284614/<IMAGE_NAME>:<TAG>
```
