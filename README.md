# EKS-Terraform
Provisioning the Elastic Kubernetes Service ( EKS ) using Terraform.

1) Create EC2 Machine. { Ubuntu }

2) Clone the Git EKS-Terraform Repo.

        - git clone https://github.com/RollBack-POC/EKS-Terraform.git

3) Go to EKS-Terraform Folder and run the follwing commands to setup VM with all the required Packages.

        - cd EKS-Terraform
        - ./install_package.sh
        - aws configure { provide the latest Access id and Secret key to configuring the aws}

4) Now install the NPM and Codefresh.

        - sudo apt install npm
        - sudo npm install -g codefresh

5) Once NPM and Codefresh is installed, provision the EKS and ECR.

        i) Update the eks.tfvars with appropriate subnet id.
                - vi eks.tfvars
                        ex:- subnet_id_1 = "subnet-0fd4fb7abcd6a6f47"
                                 subnet_id_2 = "subnet-0f3020fabcde9bfba"

        ii) Once the eks.tfvars is updated, run the terraform commands one by one to provision the EKS and ECR.
                - terraform init
                - terraform validate
                - terraform apply -var-file=eks.tfvars -auto-approve

6) After provisioning the EKS and ECR, get the details of host-ip, certificate, token from respective txt files which created in current folder.
        - cat Host-ip.txt
        - cat Certificate.txt
        - cat Token.txt

7) After getting host-ip, certificate, token values update it into codefresh for integrating the k8s cluster with codefresh.

8) To create the codefresh agent machine run the codefresh runner command.

        - export cf_token='< CodeFresh-Token >'
        - codefresh runner init --token $cf_token

Important Links:-

        - https://codefresh.io/docs/docs/integrations/kubernetes/#get-cluster-configuration-manually


