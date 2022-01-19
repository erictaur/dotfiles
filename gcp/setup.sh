#! /bin/bash

# Start fresh with the following:
if gcloud compute instances describe instance-2 ; then
    echo "Instance found! Stopping and Deleting instance..."
    gcloud compute instances stop instance-2
    gcloud compute instances delete instance-2
    gcloud compute instances create instance-2 \
        --project=catx-ext-umich \
        --zone=us-central1-a \
        --machine-type=e2-standard-32 \
        --network-interface=network-tier=PREMIUM,subnet=default \
        --can-ip-forward \
        --maintenance-policy=MIGRATE \
        --service-account=terraform-runner@catx-ext-umich.iam.gserviceaccount.com \
        --scopes=https://www.googleapis.com/auth/cloud-platform \
        --tags=vnc-server \
        --create-disk=auto-delete=yes,boot=yes,device-name=instance-2,\
        image=projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20210927,\
        mode=rw,size=512,type=projects/catx-ext-umich/zones/us-central1-a/diskTypes/pd-balanced \
        --no-shielded-secure-boot \
        --shielded-vtpm \
        --shielded-integrity-monitoring \
        --reservation-affinity=any \
        --metadata-from-file=startup-script=instance.sh
    echo "Instance deleted and created!"
    # Delete previous image archive in bucket
    # TODO: How to delete uploaded image (Not just in bucket archive)
    gsutil rm gs://catx-ext-umich-worker-bucket/scalenode-9e1d63d.tar.gz
else
    echo "Instance not found! Creating instance directly!"
    gcloud compute instances create instance-2 \
        --project=catx-ext-umich \
        --zone=us-central1-a \
        --machine-type=e2-standard-32 \
        --network-interface=network-tier=PREMIUM,subnet=default \
        --can-ip-forward \
        --maintenance-policy=MIGRATE \
        --service-account=terraform-runner@catx-ext-umich.iam.gserviceaccount.com \
        --scopes=https://www.googleapis.com/auth/cloud-platform \
        --tags=vnc-server \
        --create-disk=auto-delete=yes,boot=yes,device-name=instance-2,\
        image=projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20210927,\
        mode=rw,size=512,type=projects/catx-ext-umich/zones/us-central1-a/diskTypes/pd-balanced \
        --no-shielded-secure-boot \
        --shielded-vtpm \
        --shielded-integrity-monitoring \
        --reservation-affinity=any \
        --metadata-from-file=startup-script=instance.sh
    echo "Instance created!"
fi



