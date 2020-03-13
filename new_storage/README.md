# Create a new PowerAI Vision instance and a new block storage volume in a VPC

## Introduction
This workflow should be used to provision a new PowerAI Vision instance and block storage volume e.g. to start working on a new project within an existing VPC environment.

This repository is a companion to the one found [here](https://github.ibm.com/Thomas-Farrand/create_vpc_cluster)- which describes how to create a VPC cluster from scratch, and includes detailed documentation. 

This repository holds the containing code to provision a dedicated instance of PowerAI Vision (PAIV) Trial Edition in IBM Cloud utilizing IBM Cloud Schematics- infrastructure as code powered by Terraform. The dedicated instance of PAIV is deployed to an existing VPC environment, and attached to an newly created, partitioned and formatted block storage device. Once created, the PowerAI Vision's public IP address along with a username and password to log into the application will be displayed for easy access. 

The PowerAI Vision licence provided will expire 90 days from creation. The end-to-end process takes approximately 15 minutes from initiation to logging into a dedicated instance. This time is likely to fall in the future as pre-loaded images of PowerAI Vision are made available. 

## What do I get?
The following resources are provisioned throughout the deployment:

* Virtual Server Instance (VSI) within the VPC and a particular region and availability zone (AZ). PowerAI Vision is freshly installed onto each VSI provisioned- which act as your compute nodes. A VSI is equivalent to a VM, and the terms will be used interchangeably. 
* Floating IP (FIP) address on the public Internet
* Block storage volume.

VSIs can be stopped and destroyed with user data being persisted in the block storage volume. New instances of PAIV can then be added using either:
* An existing block storage volume, i.e. to continue work on a previous project, via https://github.ibm.com/Thomas-Farrand/create_new_vm
* This repository

## How do I use this repo?
Ensure you have a working VPC environment by following the steps found [here](https://github.ibm.com/Thomas-Farrand/create_vpc_cluster).

Then follow the step-by-step workflow in this [repository's wiki]().

-------------------------------------------------------------------------------------------------------------------------------
