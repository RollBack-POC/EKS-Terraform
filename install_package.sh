#!/bin/bash
echo "##### started Installing Packages #####"
sudo apt update
sudo apt install curl zip unzip bash
wget https://releases.hashicorp.com/terraform/1.3.7/terraform_1.3.7_linux_amd64.zip
unzip terraform_1.3.7_linux_amd64.zip
sudo install terraform /usr/local/bin
rm -rf terraform terraform_*_linux_amd64.zip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
echo "### Kubectl version ::: $(kubectl version --client --output=yaml) ###"
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
wget https://github.com/roboll/helmfile/releases/download/v0.144.0/helmfile_linux_amd64
mv helmfile_linux_amd64 helmfile
chmod 777 helmfile
sudo mv helmfile /usr/local/bin
echo "### Terraform version ::: $(terraform version) ###"
echo "### AWS version ::: $(aws --version) ###"
echo "### Helm version ::: $(helm version) ###"
echo "### Helmfile version ::: $(helmfile --version) ###"
echo "##### Completed Installing Packages #####"
