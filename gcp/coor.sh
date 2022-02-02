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

# Run logs

# VM setup file
# {
#   "gcp": {
#     "type": "n2-standard-4",
#     "disk_type": "pd-ssd",
#     "zone": "us-west1-a",
#     "project": "catx-ext-umich",
#     "subnet": "gha-runner-net",
#     "image": "scalenode-62142bf",
#     "sa": "gha-runner-coordinator-sa@catx-ext-umich.iam.gserviceaccount.com"
#   },
#   "machine": {
#     "disk": 30,
#     "preemptible": false
#   }
# }

# runner@gha-runner-coordinator:~/github-actions-runner$ supervisord -n -c supervisord.conf
# 2022-02-02 23:34:13,073 INFO supervisord started with pid 11935
# 2022-02-02 23:34:14,076 INFO spawned: '0_runner' with pid 11938
# 2022-02-02 23:34:14,077 INFO spawned: 'unbound' with pid 11939
# 2022-02-02 23:34:14,079 INFO spawned: 'registry' with pid 11940
# 2022-02-02 23:34:14,080 INFO spawned: 'runnerversion_cache' with pid 11942
# 2022-02-02 23:34:14,082 INFO spawned: 'rsyslogd' with pid 11945
# 2022-02-02 23:34:15,681 INFO success: 0_runner entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
# 2022-02-02 23:34:15,681 INFO success: unbound entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
# 2022-02-02 23:34:15,681 INFO success: registry entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
# 2022-02-02 23:34:15,681 INFO success: runnerversion_cache entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
# 2022-02-02 23:34:15,681 INFO success: rsyslogd entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)

# runner@gha-runner-coordinator:~/github-actions-runner$ ./config.sh --url https://github.com/$REPO_ORG/$REPO_NAME --token $TOKEN --num $SLOTS
# ldd: ./bin/System.Security.Cryptography.Native.OpenSsl.so: No such file or directory
# ldd: ./bin/System.IO.Compression.Native.so: No such file or directory

# Caught an exception when requesting the Runner Version:
# Message :Connection refused (localhost:15789) 
# Version Provider returned version: 2.287.1

# Caught an exception when requesting the Runner Version:
# Message :Connection refused (localhost:15789) 
# Version Provider returned version: 2.287.1

# --------------------------------------------------------------------------------
# |        ____ _ _   _   _       _          _        _   _                      |
# |       / ___(_) |_| | | |_   _| |__      / \   ___| |_(_) ___  _ __  ___      |
# |      | |  _| | __| |_| | | | | '_ \    / _ \ / __| __| |/ _ \| '_ \/ __|     |
# |      | |_| | | |_|  _  | |_| | |_) |  / ___ \ (__| |_| | (_) | | | \__ \     |
# |       \____|_|\__|_| |_|\__,_|_.__/  /_/   \_\___|\__|_|\___/|_| |_|___/     |
# |                                                                              |
# |                       Self-hosted runner registration                        |
# |                                                                              |
# --------------------------------------------------------------------------------

# # Authentication
# √ Connected to GitHub
# # Runner Registration
# Caught an exception when requesting the Runner Version:
# Message :Connection refused (localhost:15789) 
# Version Provider returned version: 2.287.1
# √ Runner successfully added
# √ Runner connection is good
# # Runner settings
# √ Settings Saved.