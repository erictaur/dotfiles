# Start fresh with the following:
# gcloud compute instances stop instance-2
# gcloud compute instances delete instance-2
# gcloud compute instances create instance-2 \
# --project=catx-ext-umich \
# --zone=us-central1-a \
# --machine-type=e2-standard-32 \
# --network-interface=network-tier=PREMIUM,subnet=default \
# --maintenance-policy=MIGRATE \
# --service-account=terraform-runner@catx-ext-umich.iam.gserviceaccount.com \
# --scopes=https://www.googleapis.com/auth/cloud-platform \
# --create-disk=auto-delete=yes,boot=yes,device-name=instance-2,\
# image=projects/debian-cloud/global/images/debian-10-buster-v20210916,\
# mode=rw,size=256,type=projects/catx-ext-umich/zones/us-central1-a/diskTypes/pd-balanced \
# --no-shielded-secure-boot \
# --shielded-vtpm \
# --shielded-integrity-monitoring \
# --reservation-affinity=any

# Delete previous image archive in bucket
# TODO: How to delete uploaded image (Not just in bucket archive)
# gsutil rm gs://catx-ext-umich-worker-bucket/scalenode-9e1d63d.tar.gz

########################################
# This script builds necessary
########################################

# Setup prerequisites
sudo apt install build-essential -y
sudo apt install git wget unzip rsync bc \
    libelf-dev autotools-dev automake \
    gcc-multilib texinfo dosfstools mtools -y

# Install Go for compiling BzImage
cd ~
wget https://golang.org/dl/go1.16.5.linux-amd64.tar.gz && \
    sudo tar -xzf go1.16.5.linux-amd64.tar.gz -C /usr/local/ && \
    export PATH=$PATH:/usr/local/go/bin

# Install Terraform
sudo apt-get install software-properties-common -y
curl -fsSL https://apt.releases.hashicorp.com/gpg | 
    sudo apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update && sudo apt install terraform -y

# Install Google Cloud SDK
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | 
    sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

sudo apt-get install apt-transport-https ca-certificates gnupg -y
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | 
    sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

sudo apt-get update && sudo apt-get install google-cloud-sdk -y

# Rebuild image
git clone --recursive \
    https://github.com/antmicro/github-actions-runner-scalerunner.git && \
        cd github-actions-runner-scalerunner/buildroot && \
        make BR2_EXTERNAL=../overlay/ scalenode_gcp_defconfig && \
        make

export PROJECT=catx-ext-umich && \
    export BUCKET=$PROJECT-worker-bucket

# Make and upload image
cd ../ && \
    ./make_gcp_image.sh && \
    ./upload_gcp_image.sh $PROJECT $BUCKET

# ssh into coordinator instance to setup runner and run config
cd ~/runner
export name=$(gcloud compute instances list | grep gha | awk '{print $1}') && \
    export zone=$(gcloud compute instances list | grep gha | awk '{print $2}') && \
    cat coor.sh | gcloud compute ssh $name --zone=$zone