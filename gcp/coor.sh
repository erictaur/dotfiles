# Update repositories and install wget.
sudo apt -qqy update && sudo apt -qqy install wget

# Download and run the installation script.
wget -O - https://raw.githubusercontent.com/antmicro/runner/vm-runners/scripts/install.sh | sudo bash

sudo -i -u runner bash
cd ~/github-actions-runner

# Init and update submodules
git submodule update --init --recursive

export REPOSITORY_ORG=idea-fasoc \
    export REPOSITORY_NAME=OpenFASOC \
    export TOKEN= \
    export SLOTS=1 \
    export SCALE=1

./config.sh --url https://github.com/$REPOSITORY_ORG/$REPOSITORY_NAME \
            --token $TOKEN \
            --num $SLOTS