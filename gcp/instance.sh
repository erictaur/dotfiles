#! /bin/bash

START_UP=/tmp/startup
if test -f "$START_UP"; then
    echo "Initialization already finished."
else
    echo "Initialization not present; Installing prerequesties"

    # Setup prerequisites
    sudo apt-get update
    sudo apt-get -qqy install file gcc-multilib mtools \
        automake autoconf build-essential bison flex \
        wget patch bc unzip make rsync binutils cpio git \
        libelf-dev python3 golang fdisk dosfstools texinfo 

    # Install Go for compiling BzImage
    # cd ~
    # wget https://golang.org/dl/go1.16.5.linux-amd64.tar.gz && \
    #     sudo tar -xzf go1.16.5.linux-amd64.tar.gz -C /usr/local/ && \
    #     export PATH=$PATH:/usr/local/go/bin

    # Install Terraform
    sudo apt-get install software-properties-common -y
    curl -fsSL https://apt.releases.hashicorp.com/gpg | \
        sudo apt-key add -
    sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    sudo apt update && sudo apt install terraform -y

    # Install Google Cloud SDK
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | \
        sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

    sudo apt-get install apt-transport-https ca-certificates gnupg -y
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
        sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

    sudo apt-get update && sudo apt-get install google-cloud-sdk -y

    # Remove all created resources by Terraform
    yes | gsutil rm gs://catx-ext-umich-worker-bucket/scalenode-62142bf.tar.gz
    yes | gcloud compute images delete scalenode-62142bf
    yes | gcloud compute instances delete gha-runner-coordinator --zone=us-west1-a
    yes | gcloud compute firewall-rules delete gha-runner-net---ssh-from-outside \
            gha-runner-net---deny-access-coordinator \
            gha-runner-net---access-runners \
            gha-runner-net---allow-coordinator-services
    yes | gcloud compute routers delete gha-runner-net---cloud-router \
            --project=catx-ext-umich \
            --region=us-west1
    yes | gcloud compute networks subnets delete gha-runner-net --region=us-west1
    yes | gcloud compute networks delete gha-runner-net
    yes | gcloud iam service-accounts delete gha-runner-coordinator-sa@catx-ext-umich.iam.gserviceaccount.com
    yes | gcloud compute disks delete gha-runner-coordinator---boot-disk --zone=us-west1-a

    # Rebuild image
    cd /tmp && \
        git clone --recursive \
        https://github.com/antmicro/github-actions-runner-scalerunner.git && \
            cd github-actions-runner-scalerunner/buildroot && \
            make BR2_EXTERNAL=../overlay/ scalenode_gcp_defconfig && \
            ( FORCE_UNSAFE_CONFIGURE=1 make -j$(nproc) 2>&1 | tail -10000 ) || FORCE_UNSAFE_CONFIGURE=1 make

    export PROJECT=catx-ext-umich && \
        export BUCKET=$PROJECT-worker-bucket

    # Make and upload image
    cd ../ && \
        ./make_gcp_image.sh && \
        ./upload_gcp_image.sh $PROJECT $BUCKET

    # Run Terraform with plan file
    cd /tmp && \
        git clone https://github.com/antmicro/github-actions-runner-terraform.git && \
        cd github-actions-runner-terraform

    echo 'catx-ext-umich' | terraform init
    echo 'catx-ext-umich' | terraform apply -auto-approve

    # Create startup checkpoint
    touch /tmp/startup
    echo "Initialization completed!"

fi

gcloud compute ssh gha-runner-coordinator --zone=us-west1-a