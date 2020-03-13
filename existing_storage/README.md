# Create a new Watson Machine Learning Community Edition (WMLCE) environment in an existing VPC

## Introduction
This workflow should be used to provision a new WMLCE instance inside of an existing VPC, and attach it to an existing block storage volume e.g. to continue working on a project.

This repository holds the containing code to provision a dedicated environment of WMLCE in IBM Cloud utilizing IBM Cloud Schematics- infrastructure as code powered by Terraform. The dedicated instance of WMLCE is deployed to an existing VPC environment, and attached to an existing partitioned and formatted block storage device. Once created, the environment's public IP address, along with an access token to log into Jupyterlab will be displayed for easy access. 

As the existing block storage device should have stored the anaconda installation and the user generated data there is no software to install. Therefore, the end-to-end process should take approximately 5 minutes from initiation to logging into a dedicated instance.

## What do I get?
The following resources are provisioned throughout the deployment:

* Virtual Server Instance (VSI) within the VPC and a particular region and availability zone (AZ). A VSI is equivalent to a virtual machine (VM), and the terms will be used interchangeably. 
* Floating IP (FIP) address on the public Internet. This can be checked through the VPC GUI, found [here](https://cloud.ibm.com/vpc/overview)

VSIs can be stopped and destroyed with user data being persisted in the block storage volume. New instances of WMLCE can then be added using either:
* This repository, to attach new instances to existing block storage. 
* A new block storage volume, i.e. to start a new distinct project, via 
https://github.com/FarrandTom/vpc-cloud-wmlce/tree/master/new_storage

## How do I use this repo?
Ensure you have a working VPC environment by following the steps found [here](https://github.com/FarrandTom/vpc-cloud-wmlce/tree/master/new_vpc_cluster).

Then follow the step-by-step workflow in this [repository's wiki]().

-------------------------------------------------------------------------------------------------------------------------------
