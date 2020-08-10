# gcp-outdoorsy-terraform

## Dockerization of the Applications.
Dockerizing an application is the process of converting an application to run within a Docker container.

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
Steps to push the image to GCR.</br>
**Step 1: Tag the image with the container registry location.**
```
$ docker tag <IMAGE_ID> us.gcr.io/searchpoc-284614/<IMAGE_NAME>:<TAG>
```

**Step 2: Push the image to GCR**
```
$ gcloud docker -- push us.gcr.io/searchpoc-284614/<IMAGE_NAME>:<TAG>
```

## Deploying application on Google Kubernetes Enginer (GKE)
### Deploying RabbitMQ and Datadog services on GKE.

**Deploying RabbitMQ on GKE**
RabbitMQ is the most widely deployed open source message broker.RabbitMQ is lightweight and easy to deploy on premises and in the cloud. It supports multiple messaging protocols. RabbitMQ can be deployed in distributed and federated configurations to meet high-scale, high-availability requirements.</br></br>

**Steps**
Step 1: Go to the folder **/RabbitMQ**.

Step 2: You'll find the *rabbitmq.yaml* and *rabbitmq-rbac.yaml* files. *rabbitmq.yaml* is used to deploy the **StatefulSet**, **Service** and **PersistentVolumeClain** where *rabbitmq-rbac* is used to deploy the **ServiceAccount**, **Roles** and **RoleBinding**.

Step 3: Run the below commands to deploy the manifest files.
```
$ kubectl apply -f rabbitmq.yaml
$ kubectl apply -f rabbiit-rbac.yaml
```

**Deploying Datadog service on GKE**
Datadog is a monitoring service for cloud-scale applications, providing monitoring of servers, databases, tools, and services, through a SaaS-based data analytics platform.

**Steps**
Step 1: Go to the folder **/Datadog**.

Step 2: You'll find the *dd-agent.yaml*, *dd-rbac.yaml* and *dd-secret.yaml* files. *dd-agent.yaml* is used to deploy **Deployment** for Datadog Cluster Agent and **Daemonset** for Datadog Node Agent along with their **Services**.

Step 3: Run the below commands to deploy the manifest file.
```
$ kubectl apply -f dd-agent.yaml

```

Step 4: Deploy the *dd-rbac.yaml* by running below command
```
$ kubectl apply -f dd-rbac.yaml

```
This will deploy the **ServiceAccount**, **ClusterRoles** and **ClusterRoleBinding**.

Step 5: Deploy the *dd-secret.yaml* by running below command
```
$ kubectl apply -f dd-secret.yaml

```
This will deploy the **Secret** in which we can store the confidential information required for the services.

### Deploying odc-search and odc-worker app on GKE.

The **odc-search** and **odc-worker** application use env variables and some API keys for their configuration. To store the env variables and API keys, we use **ConfigMap** and **Secrets**. **Ingress** is also used to manage the external access to the services.</br>

Kubernetes ConfigMap is used to store non-confidential data in key-value pairs and Kubernetes Secrets let you store and manage sensitive information, such as passwords, OAuth tokens, and ssh keys in a safer and more flexible way.</br>

To deploy the **ConfigMap** and **Secret** in GKE,</br> 
Step 1: Get into the folder named **/Apps**.

Step 2: Get the *configmap.yaml* and *secret.yaml*

Step 3: Deploy these manifest files by using the following commands.

```
$ kubectl apply -f configmap.yaml
$ kubectl apply -f secret.yaml
```

Kubernetes Ingress is an API object that manages external access to the services in a cluster, typically HTTP. Ingress may provide load balancing, SSL termination and name-based virtual hosting.We have used Google Managed SSL certificates</br>

Step 4: To deploy ingress, get the mainfest file named *ingress.yaml* and run the following command. This will deploy the **Ingress** and **ManagedCertificate**.
```
$ kubectl apply -f ingress.yaml
```
## odc-search
**Steps**
For **odc-search**, there is a manifest file named *odc-search-deployment.yaml*. This file will deploy the *odc-search* app on GKE.

Step 1: Get the file *odc-search-deployment.yaml*.

Step 2: Run the following command to deploy the app on GKE.
```
$ kubectl apply -f odc-search-deployment.yaml

```

## odc-worker
**Steps**
For **odc-worker**, there is a manifest file named *odc-worker-deployment.yaml*. This file will deploy the *odc-worker* app on GKE.

Step 1: Get the file *odc-worker-deployment.yaml*.

Step 2: Run the following command to deploy the app on GKE.
```
$ kubectl apply -f odc-worker-deployment.yaml

```

## Testing

To test the application, we can hit the ingress and check the response of it. The URL is
```
https://search-poc.outdoorsy.co

```


