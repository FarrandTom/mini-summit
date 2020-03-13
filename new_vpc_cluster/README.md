# Start From Scratch
## Create a new Watson Machine Learning Community Edition (WMLCE) environment in a New Virtual Private Cloud (VPC)!

## Introduction
This repository holds the containing code to provision a dedicated instance of [Watson Machine Learning Community Edition](https://www.ibm.com/support/knowledgecenter/en/SS5SF7_1.7.0/navigation/welcome.html) in the IBM Cloud utilizing IBM Cloud Schematics- infrastructure as code powered by Terraform. The dedicated instance of WMLCE is deployed to IBM's Virtual Private Cloud (VPC) infrastructure. 

Once created, its public IP address along with token to log into the application will be displayed for easy access. 

The time taken for the end-to-end process to occur is heavily dependent on the Python packages which are selected to be installed on the Virtual Server Instance (VSI). The default packages which are installed are the WMLCE bundle, and Jupyterlab. With these packages the end-to-end process takes approximately 40 minutes from initiation to logging into a dedicated instance. The majority of this time is downloading and installing the approximate ~3GB of packages which comprise WMLCE. Therefore, if you solely wanted, for example, TensorFlow then this time will dramatically fall. 

## What do I get?
The following resources are provisioned throughout the deployment:

* Virtual Private Cloud (VPC)
* Subnet
* Virtual Server Instance (VSI) within the VPC and a particular region and availability zone (AZ). WMLCE is freshly installed onto each VSI provisioned- which act as your compute nodes. A VSI is equivalent to a VM, and the terms will be used interchangeably. 
* Floating IP (FIP) address on the public Internet.
* Security group that allows ingress traffic on port 443 (SSL) and on port 22 (for debug)
* Block storage volume where user generated data is persisted even after the instance is destroyed.

![VPC architecture](https://github.com/FarrandTom/vpc-cloud-wmlce/blob/master/readme-images/architecture.png)
  
VSIs can be stopped and destroyed with user data being persisted in the block storage volume. New instances of WMLCE can then be added using either:
* An existing block storage volume, i.e. to continue work on a previous project, via https://github.com/FarrandTom/vpc-cloud-wmlce/tree/master/existing_storage
* A new block storage volume, i.e. to start a new distinct project, via 
https://github.com/FarrandTom/vpc-cloud-wmlce/tree/master/new_storage

## How do I use this repo?
The high-level workflow to get up and running with WMLCE on the IBM Cloud is as follows:
1. Link this repository to IBM Cloud Schematics
2. Fill in the necessary credentials
3. Go!

The step-by-step workflow can be found in this [repository's wiki](https://github.com/FarrandTom/vpc-cloud-wmlce/wiki/Start-from-Scratch).

-------------------------------------------------------------------------------------------------------------------------------
