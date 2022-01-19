# Run this script in the created instance

# Run this script after TOKEN is generated for coor.sh

# ssh into coordinator instance to setup runner and run config
cd ~ && \
    git clone https://github.com/erictaur/dotfiles.git \
    cd dotfiles/gcp

export name=$(gcloud compute instances list | grep gha | awk '{print $1}') && \
    export zone=$(gcloud compute instances list | grep gha | awk '{print $2}') && \
    cat coor.sh | gcloud compute ssh $name --zone=$zone