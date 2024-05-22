# Kubernetes Example

## Description

This tutorial is designed to help you set up a Kubernetes environment and run example code across various platforms including localhost, Docker, and Kubernetes. By the end of this tutorial, you should have a solid understanding of the following: 

- Configuring a Kubernetes cluster on localhost using `Minikube`. 
- Building `Docker` images and managing Docker containers. 
- Utilizing Kubernetes `declarative APIs` to manage pods. 
- Running and operating `Kubernetes pods` effectively.

## Prerequisites

**Objective:** Install Docker and Minikube to create a local Kubernetes cluster. This setup allows you to run and manage containers in a development environment that mirrors a production cluster, facilitating easier testing and deployment processes. 

Ensure you have the following installed:

- Python 3.X, e.g., 3.10 
-  [Docker](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)

```shell
 # Add Docker's official GPG key:
 sudo apt-get update
 sudo apt-get install ca-certificates curl
 sudo install -m 0755 -d /etc/apt/keyrings
 sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
 sudo chmod a+r /etc/apt/keyrings/docker.asc
 # Add the repository to Apt sources:
 echo \
   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
   $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
 sudo apt-get update
 sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
 sudo docker run hello-world
 sudo usermod -aG docker ${USER}
```

- [Minikube](https://minikube.sigs.k8s.io/docs/start/)

```shell
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
minikube start
alias kubectl="minikube kubectl --"
```

## Run HTTP Server on Host Machine

**Objective:** Start and access a simple HTTP server directly on your host machine. This step demonstrates how to run basic networked applications using Python, setting a foundation for more complex containerized deployments.

1. Start the HTTP server on port 8080: 

```shell
python3 server.py # run a server on port 8080
```

2. Access the HTTP server from a client script or a web browser:

```shell
python3 client.py localhost 8080 # or access from browser: localhost:8080
```

## Run HTTP Server as Docker Container

**Objective:** Build Docker images and run containers. This step teaches how to containerize applications, which simplifies deployments and scalability in production environments.

There are two images to be built, i.e., `server` and `client` image. We first build two images and then run different methods to access them.


1. Navigate to the server and client directories, build Docker images, and push them to `Dockerhub` for container registry::

```shell
cd server/
docker build -t ${user}/server-image .
docker push ${user}/server-image
cd client/
docker build -t ${user}/client-image .
docker push ${user}/client-image
```

2. Start the server container in detached mode, demonstrating how to run and manage Docker containers:

```shell
docker run --name server --rm -d ${user}/server-image
```


3. Access the HTTP server using different methods to demonstrate container networking and inter-container communication

- Inside the container:

```shell
docker ps # To check the Server ${Container_ID}
docker exec -i -t ${Container_ID} /bin/bash
python3 client.py localhost 8080
```

- From another container:

```shell
docker run --name client  --rm -d ${user}/client-image
docker ps # To check the ${Client_Container_ID}
docker inspect server # Check and get server ${Server_Container_IP}
docker exec -i -t ${Client_Container_ID} /bin/bash
python3 client.py ${Server_Container_IP} 8080
```

- From Host OS via port-forwarding:

```shell
docker run --name server  --rm -d -p 8081:8080 ${user}/server-image # delete and run a new server container
# Access from browser: localhost:8081
```

## Run HTTP Server as Kubernetes Pod

**Objective:** Deploy and manage applications using Kubernetes pods. This step explores how Kubernetes manages containerized applications and demonstrates basic pod operations including deployment, interaction, and external access.

All Kubernetes YAML Files are in `kube-yaml`.

1. Deploy the HTTP server pod using a Kubernetes YAML file, introducing pod management and application deployment in a Kubernetes environment:

```shell
kubectl apply -f server-pod.yaml
```

2. Access the HTTP server in different contexts to illustrate pod networking, pod-to-pod communication, and external access

- Inside the pod:

```shell
kubectl exec -i -t http-server -- /bin/bash
python3 client.py localhost 8080
```

- From another pod:

```shell
kubectl describe pod http-server # Check description and get ${POD_IP}
kubectl apply -f client-pod.yaml
kubectl exec -i -t http-client -- /bin/bash
python3 client.py ${POD_IP} 8080
```

- From Host OS via port-forwarding:

```shell
kubectl port-forward --address 0.0.0.0 http-server 8081:8080
# Access from browser: localhost:8081
```

