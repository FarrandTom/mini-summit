# PowerAI Vision on IBM Cloud

## Introduction
This repository holds the containing code to provision a dedicated instance of PowerAI Vision (PAIV) Trial Edition in IBM Cloud utilizing IBM Cloud Schematics- infrastructure as code powered by Terraform. The dedicated instance of PAIV is deployed to IBM's Virtual Private Cloud (VPC) infrastructure. 

Once created, its public IP address along with a username and password to log into the application will be displayed for easy access. 

The PowerAI Vision licence provided will expire 90 days from creation. The end-to-end process takes approximately 15 minutes from initiation to logging into a dedicated instance. This time is likely to fall in the future as pre-loaded images of PowerAI Vision are made available. 

## What do I get?
The following resources are provisioned throughout the deployment:

* Virtual Private Cloud (VPC)
* Subnet
* Virtual Server Instance (VSI) within the VPC and a particular region and availability zone (AZ). PowerAI Vision is freshly installed onto each VSI provisioned- which act as your compute nodes. A VSI is equivalent to a VM, and the terms will be used interchangeably. 
* Floating IP (FIP) address on the public Internet
* Security group that allows ingress traffic on port 443 (SSL) and on port 22 (for debug)
* Block storage volume where user generated data is persisted even after the instance is destroyed.

![VPC architecture](https://github.ibm.com/Thomas-Farrand/create_vpc_cluster/blob/master/readme-images/architecture.png)
  
VSIs can be stopped and destroyed with user data being persisted in the block storage volume. New instances of PAIV can then be added using either:
* An existing block storage volume, i.e. to continue work on a previous project, via https://github.ibm.com/Thomas-Farrand/create_new_vm
* A new block storage volume, i.e. to start a new distinct project, via 
https://github.ibm.com/Thomas-Farrand/create_new_vm_plus_storage

## How do I use this repo?
The high-level workflow to get up and running with PAIV on the IBM Cloud is as follows:
1. Link this repository to IBM Cloud Schematics
2. Fill in the necessary credentials
3. Go!

The step-by-step workflow can be found in this [repository's wiki](https://github.ibm.com/Thomas-Farrand/create_vpc_cluster/wiki/Guide:-Create-Your-Own-VPC-PowerAI-Vision-Instance!).

-------------------------------------------------------------------------------------------------------------------------------
