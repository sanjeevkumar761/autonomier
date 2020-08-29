sudo su
usermod -aG sudo juser
sudo su - juser
cd /home/juser
chown juser /home/juser
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube
sudo install minikube /usr/local/bin/
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt install conntrack
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
#sudo usermod -aG docker $USER && newgrp docker
sudo minikube start --driver=none
sudo minikube status
wget https://get.helm.sh/helm-v3.3.0-rc.1-linux-amd64.tar.gz
tar -zxvf helm-v3.3.0-rc.1-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client
sudo apt-get update && sudo apt-get -y install socat
sudo curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash



sudo kubectl create namespace kubeapps
sudo su

export azureacr_user=publictoken
export azureacr_token=2Lq4uQU9797zdf1Ym=ugoKfwGvhd0AWJ

# az acr login --name souveniracr --username $2 --password $3 
az acr login --name autonomier --username $azureacr_user --password $azureacr_token
docker pull autonomier.azurecr.io/kubeapps/dashboard

export HELM_EXPERIMENTAL_OCI=1
echo $azureacr_token | helm registry login autonomier.azurecr.io \
  --username $azureacr_user \
  --password-stdin

helm chart pull autonomier.azurecr.io/helm/kubeapps:v1
helm chart export autonomier.azurecr.io/helm/kubeapps:v1 \
  --destination ./install

cd install
helm dependency update kubeapps
sudo helm install kubeapps --namespace kubeapps ./kubeapps --set useHelm3=true

sudo kubectl create namespace autonomier-apps
az acr login --name autonomier --username $azureacr_user --password $azureacr_token 
docker pull autonomier.azurecr.io/autonomier/apollo-deployment:latest
export HELM_EXPERIMENTAL_OCI=1
echo $azureacr_token | helm registry login autonomier.azurecr.io \
  --username $azureacr_user \
  --password-stdin
helm chart pull autonomier.azurecr.io/helm/apollo-deployment:v1
helm chart export autonomier.azurecr.io/helm/apollo-deployment:v1 \
  --destination ./install
cd install
sudo helm install one-touch-sap-deployment --namespace autonomier-apps ./apollo-deployment --set useHelm3=true

sudo su

# helm chart pull souveniracr.azurecr.io/helm/kubeapps:v1
# helm chart export souveniracr.azurecr.io/helm/kubeapps:v1 \
#  --destination ./install

# sudo helm repo add bitnami https://charts.bitnami.com/bitnami

# cd install
sudo kubectl create serviceaccount kubeapps-operator
sudo kubectl create clusterrolebinding kubeapps-operator --clusterrole=cluster-admin --serviceaccount=default:kubeapps-operator


cd /home/juser
sudo apt install -y npm 
git clone https://github.com/sanjeevkumar761/autonomier.git
cd autonomier
cd k8s-login-helper 
npm install
sudo su
export HOST=0.0.0.0
sudo node index.js &

sleep 2m
sudo kubectl port-forward -n kubeapps svc/kubeapps 8080:80 --address 0.0.0.0 &
sleep 1m
sudo kubectl port-forward -n autonomier-apps svc/apollo-deployment 8081:3000 --address 0.0.0.0 &

#sudo rm /var/lib/apt/lists/lock
#sudo rm /var/cache/apt/archives/lock
#sudo rm /var/lib/dpkg/lock*