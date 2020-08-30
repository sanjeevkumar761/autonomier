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
#install nvidia drivers
sudo apt-get install ubuntu-drivers-common -y
sudo ubuntu-drivers autoinstall
#START of Install nvidia-docker
#distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
#curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
#curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
#sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
#sudo systemctl restart docker
#END of Install nvidia-docker
#install LG fork of apollo 5.5
sudo docker pull lgsvl/apollo-3.5
apt-get install expect -y
cd /home/juser
git clone https://github.com/sanjeevkumar761/autonomier.git
git clone --recurse-submodules https://github.com/lgsvl/apollo-3.5.git
cd apollo-3.5
# echo -e '#!/usr/bin/expect -f' >> apollo_build.sh && echo "set timeout -1" >> apollo_build.sh && echo "spawn ./docker/scripts/dev_start.sh" >> apollo_build.sh && echo expect '"Type 'y' or 'Y' to agree to the license agreement above, or type any other key to exit\r"' >> apollo_build.sh && chmod +x apollo_build.sh && echo "./apollo_build.sh" >> full_apollo_build.sh && echo "./apollo.sh build_gpu" >> full_apollo_build.sh && chmod +x full_apollo_build.sh  && ./full_apollo_build.sh && ./scripts/bootstrap.sh
# export azureacr_user=publictoken
# export azureacr_token=xVfSSlhVm1PRz/dh6FbWIteJEir806Px

# az acr login --name souveniracr --username $2 --password $3 
# az acr login --name autonomier --username $azureacr_user --password $azureacr_token

# docker tag lgsvl/apollo-3.5 autonomier.azurecr.io/autonomier/apollo-deployment:3.5
# docker push autonomier.azurecr.io/autonomier/apollo-deployment:3.5

# START bare docker
# apollo is not ready for Kubernetes yet, hence using bare docker 
# docker pull autonomier.azurecr.io/autonomier/apollo-deployment:3.5
# echo -e '#!/usr/bin/expect -f' >> apollo_build.sh && echo "set timeout -1" >> apollo_build.sh && echo "spawn ./docker/scripts/dev_start.sh" >> apollo_build.sh && echo expect '"Type 'y' or 'Y' to agree to the license agreement above, or type any other key to exit\r"' >> apollo_build.sh && chmod +x apollo_build.sh && echo "./apollo_build.sh" >> full_apollo_build.sh && echo "./apollo.sh build_gpu" >> full_apollo_build.sh && chmod +x full_apollo_build.sh  && ./full_apollo_build.sh && ./scripts/bootstrap.sh
cp ../autonomier/apollo-build/answer_user_agreement_and_build_apollo.sh .
chmod +x answer_user_agreement_and_build_apollo.sh
./answer_user_agreement_and_build_apollo.sh
./docker/scripts/dev_into.sh
./apollo.sh build_gpu
./scripts/bootstrap.sh
# END bare docker 


#sudo minikube start --driver=none
#sudo minikube status
#wget https://get.helm.sh/helm-v3.3.0-rc.1-linux-amd64.tar.gz
#tar -zxvf helm-v3.3.0-rc.1-linux-amd64.tar.gz
#sudo mv linux-amd64/helm /usr/local/bin/helm
#curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
#chmod +x ./kubectl
#sudo mv ./kubectl /usr/local/bin/kubectl
#kubectl version --client
#sudo apt-get update && sudo apt-get -y install socat
#sudo curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash



#sudo kubectl create namespace kubeapps
#sudo su

#docker pull autonomier.azurecr.io/kubeapps/dashboard:latest

#export HELM_EXPERIMENTAL_OCI=1
#echo $azureacr_token | helm registry login autonomier.azurecr.io \
#  --username $azureacr_user \
#  --password-stdin

#helm chart pull autonomier.azurecr.io/helm/kubeapps:v1
#helm chart export autonomier.azurecr.io/helm/kubeapps:v1 \
#  --destination ./install

#cd install
#helm dependency update kubeapps
#sudo helm install kubeapps --namespace kubeapps ./kubeapps --set useHelm3=true

#sudo kubectl create namespace autonomier-apps
#az acr login --name autonomier --username $azureacr_user --password $azureacr_token 
#docker pull autonomier.azurecr.io/autonomier/apollo-deployment:3.5
#export HELM_EXPERIMENTAL_OCI=1
#echo $azureacr_token | helm registry login autonomier.azurecr.io \
#  --username $azureacr_user \
#  --password-stdin
#helm chart pull autonomier.azurecr.io/helm/apollo-deployment:v1
#helm chart export autonomier.azurecr.io/helm/apollo-deployment:v1 \
#  --destination ./install
#cd install
#sudo helm install one-touch-sap-deployment --namespace autonomier-apps ./apollo-deployment --set useHelm3=true

#sudo su

#sudo kubectl create serviceaccount kubeapps-operator
#sudo kubectl create clusterrolebinding kubeapps-operator --clusterrole=cluster-admin --serviceaccount=default:kubeapps-operator


#sudo apt install -y npm 
#cd /home/juser/autonomier
#cd k8s-login-helper 
#npm install
#sudo su
#export HOST=0.0.0.0
#sudo node index.js &

#sleep 2m
#sudo kubectl port-forward -n kubeapps svc/kubeapps 8080:80 --address 0.0.0.0 &
#sleep 1m
#sudo kubectl port-forward -n autonomier-apps svc/apollo-deployment 8081:3000 --address 0.0.0.0 &
