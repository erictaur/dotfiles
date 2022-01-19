The following instructions demonstrate how to set up a self-hosted CI infrastructure using GCP.


In any local machine running bash, run the `setup.sh` script to set up an instance.


After the instance is set up, SSH into that instance and create a TOKEN from the repository that would be checked by a self-hosted CI.
Fill in the TOKEN in `run_coor.sh` then run `coor.sh`

TODO:

Issue 1:
How to check if compiled image is working fine?

List of observed ignored errors when `make`ing the image:


echo timestamp > stamp-pb
echo timestamp > stamp-host
make: [Makefile:1773: x86_64-buildroot-linux-gnu/bits/largefile-config.h] Error 1 (ignored)
make: [Makefile:1774: x86_64-buildroot-linux-gnu/bits/largefile-config.h] Error 1 (ignored)


/sbin/ldconfig.real: Can't create temporary cache file /etc/ld.so.cache~: Permission denied
8
make: [Makefile:151: install-shared-cap] Error 1 (ignored)


rm: cannot remove '/home/khtaur/github-actions-runner-scalerunner/buildroot/output/per-package/host-python3/host/lib/python3.9/lib-dynload/__pycache__': No such file or directory
make: [Makefile:1768: sharedinstall] Error 1 (ignored)


/sbin/ldconfig.real: Can't create temporary cache file /etc/ld.so.cache~: Permission denied
make: [Makefile:162: install-shared-psx] Error 1 (ignored)


chown: changing ownership of '/home/khtaur/github-actions-runner-scalerunner/buildroot/output/per-package/screen/target/usr/bin/screen': Operation not permitted
make: [Makefile:87: install_bin] Error 1 (ignored)


make: *** [Makefile:84: _all] Error 2


make_gcp_image.sh and uploading to gcp works fine though.


Issue 2:

Terraform apply does not work despite everything is reset via Terraform destroy

First Error:
```
│ Error: Error creating Network: googleapi: Error 409: The resource 'projects/catx-ext-umich/global/networks/gha-runner-net' already exists, alreadyExists
│ 
│   with google_compute_network.gha-network,
│   on main.tf line 28, in resource "google_compute_network" "gha-network":
│   28: resource "google_compute_network" "gha-network" {
│ 
╵
```

Second Error:
```
╷
│ Error: Error creating service account: googleapi: Error 409: Service account gha-runner-coordinator-sa already exists within project projects/catx-ext-umich.
│ Details:
│ [
│   {
│     "@type": "type.googleapis.com/google.rpc.ResourceInfo",
│     "resourceName": "projects/catx-ext-umich/serviceAccounts/gha-runner-coordinator-sa@catx-ext-umich.iam.gserviceaccount.com"
│   }
│ ]
│ , alreadyExists
│ 
│   with google_service_account.gha-coordinator-sa,
│   on main.tf line 121, in resource "google_service_account" "gha-coordinator-sa":
│  121: resource "google_service_account" "gha-coordinator-sa" {
```

Commands that could be helpful:
```
yes | gcloud compute routers delete gha-runner-net---cloud-router \
        --project=catx-ext-umich \
        --region=us-west1
yes | gcloud compute networks delete gha-runner-net
yes | gcloud iam service-accounts delete gha-runner-coordinator-sa@catx-ext-umich.iam.gserviceaccount.com
yes | gcloud compute disks delete gha-runner-coordinator---boot-disk --zone=us-west1-a
```

Issue 3:

How to fill in the following VM specs?
```
{
  "gcp": {
    "type": "n2-standard-4",
    "disk_type": "pd-ssd",
    "zone": "us-west1-a",
    "project": "my-cool-project",
    "subnet": "my-cool-subnet",
    "image": "scalenode-2021-05-12--15-06-54",
    "sa": "cool-service-account@my-cool-project.iam.gserviceaccount.com"
  },
  "machine": {
    "disk": 30,
    "preemptible": false
  }
}
```

Is it the:
(1) VM used to run the setup for constructing the image
(2) VM that is created by Terraform

When creating the VM for setting up the infra, we did not specify a subnet/image


