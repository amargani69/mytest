## install docker

apt  install docker.io -y

docker -v

## clone github

git clone https://github.com/shaiksaiteja/finalproject.git

cd finalproject/

## build docker image
docker build -t newget .
## check image is created or not with newget
docker images

docker run <imgid> -p 8000:8000

## login to docker
docker login


## push img to dockerhub
docker tag <img-name> <dockerhub-username>/<dockerhub-repo-name>:tagname
docker push shaiksaiteja/finalsemproject:newget


ex:
docker tag newget shaiksaiteja/finalsemproject:newget
### newget : myimage name
### shaiksaiteja : dockerhub username
### finalsemproject : dockerhub repo name
### newget : tag giving to img 


# __________________________________________________________________________


docker pull shaiksaiteja/finalsemproject:newget

docker run -p 8000:8000 shaiksaiteja/finalsemproject:newget

# new image:  shaiksaiteja/final-sem-cicd:16  

# ----------------------------------------
# ----------------------------------------
# ----------------------------------------
# ----------------------------------------
# ----------------------------------------





sudo apt update -y
sudo apt install openjdk-11-jre -y

curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update -y
sudo apt-get install jenkins -y
sudo apt install docker.io -y

sudo su - 
sudo usermod -aG docker jenkins
sudo usermod -aG docker ubuntu
sudo systemctl restart docker
sudo systemctl restart jenkins



_____________________________________________\

#!/bin/bash

# Update the system
sudo apt-get update -y

# Install Docker
sudo apt-get install docker.io -y
sudo usermod -aG docker ubuntu
sudo systemctl restart docker
sudo systemctl restart jenkins


# Download and install Minikube
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo cp minikube-linux-amd64 /usr/local/bin/minikube
sudo chmod 755 /usr/local/bin/minikube

# Download and install kubectl
sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
sudo chmod +x kubectl
sudo mv kubectl /usr/local/bin/kubectl

# Add the user to the docker group
sudo usermod -aG docker $USER && newgrp docker

# Start Minikube again (may be needed after adding user to the docker group)
minikube start

# Check Minikube status
minikube status
_______________________________________________


ubuntu@ip-172-31-63-128:~/argo-cd/manifests$ minikube ip
192.168.49.2

ubuntu@ip-172-31-63-128:~/argo-cd/manifests$ kubectl get svc argocd-server -n argocd
NAME            TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)                      AGE
argocd-server   NodePort   10.99.148.120   <none>        80:31854/TCP,443:30260/TCP   29m



sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 31854 -j DNAT --to-destination 192.168.49.2:31854
sudo iptables -A FORWARD -p tcp -d 192.168.49.2 --dport 31854 -j ACCEPT


ubuntu@ip-172-31-63-128:~$ sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 31396 -j DNAT --to 192.168.49.2:31396
ubuntu@ip-172-31-63-128:~$ sudo iptables -A FORWARD -p tcp -d 192.168.49.2 --dport 31396 -j ACCEPT

ubuntu@ip-172-31-63-128:~$ sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 8000 -j DNAT --to 192.168.49.2:8000
ubuntu@ip-172-31-63-128:~$ sudo iptables -A FORWARD -p tcp -d 192.168.49.2 --dport 8000 -j ACCEPT


kubectl get secret argocd-initial-admin-secret -n argocd -o=jsonpath='{.data.password}' | base64 -d


___________________________________________


docker key            --generate it
github key    --generate it



https://github.com/dmancloud/tutorial-documentation/blob/main/docs/install-argocd.md




ubuntu@ip-172-31-63-128:~$ history
    1  sudo apt update
    2  sudo apt upgrade
    3  sudo bash
    4  sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
    5  sudo kubectl -n argocd get secret
    6  sudo kubectl get secret
    7  ls
    8  kubectl get secrets -n argocd
    9  kubectl get secret argocd-secret -n argocd -o yaml
   10  kubectl get secret argocd-secret -n argocd -o jsonpath='{.data}' | base64 --decode
   11  sudo kubectl get secret argocd-secret -n argocd -o jsonpath='{.data}' | base64 --decode
   12  kubectl get secret argocd-secret -n argocd -o jsonpath='{.data.tls\.key}' | base64 -d
   13  kubectl get secret argocd-secret -n argocd -o jsonpath="{.data.admin\.password}" | base64 --decode
   14  kubectl get secret argocd-secret -n argocd -o jsonpath="{.data.admin\.password}" | base64 -d
   15  kubectl get secret argocd-secret -n argocd -o yaml
   16  echo -n JDJhJDEwJDFJUzE1VUkvTzVXQmRrNUZQc0ZYNGVOcHRxcm5yUDZsaC9HM09UUmJCd1BXMElqemljUFRh | base64 -d
   17  kubectl get secrets -n argocd
   18  kubectl get secret argocd-initial-admin-secret -n argocd -o=jsonpath='{.data.password}' | base64 -d
   19  kubectl get pods -n argo-cd/
   20  kubectl get pods -n argo-cd
   21  kubectl get pods -n argoc
   22  kubectl get pods -n argocd
   23  kubectl get svc -n argocd
   24  kubectl get nodes -n argocd
   25  kubectl get pods
   26  kubectl get svc
   27  kubectl get kubectl describe svc aqi-app-service
   28  kubectl describe svc aqi-app-service
   29  minikube ip
   30  sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 8000 -j DNAT --to 192.168.49.2:31396
   31  minikube ip
   32  kubectl describe svc aqi-app-service
   33  kubectl get pods
   34  telnet 192.168.49.2 31396
   35  kubectl get pods -n default
   36  kubectl describe svc aqi-app-service
   37  kubectl logs aqi-app-6d9798dd66-4jp49 -n default
   38  kubectl describe svc aqi-app-service
   39  sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 31396 -j DNAT --to 192.168.49.2:31396
   40  sudo iptables -A FORWARD -p tcp -d 192.168.49.2 --dport 31396 -j ACCEPT
   41  sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 8000 -j DNAT --to 192.168.49.2:8000
   42  sudo iptables -A FORWARD -p tcp -d 192.168.49.2 --dport 8000 -j ACCEPT
   43  history


