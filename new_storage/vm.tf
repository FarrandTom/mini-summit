
variable "vpc_basename" {
  description = "Denotes the name of the VPC that WMLCE will be deployed into. Resources associated with WMLCE will be prepended with this name."
}

variable "expect_gpus" {
  description = "Should the provisioning code expect to find GPU capability? 0 - GPUs disabled; 1 - GPUs enabled and expected to be present"
  default = "1"
}

variable "vpc_region" {
  description = "Target region to create this instance of WMLCE"
  default = "us-south"
}

variable "vpc_zone" {
  description = "Target availbility zone to create this instance of WMLCE"
  default = "us-south-1"
}

variable "subnet_id" {
    description = "ID of the existing subnet to attach onto."
}

variable "vm_name" {
    description = "Name of the new VM to be provisioned."
}

variable "vm_profile" {
  description = "What resources or VM profile should we create for compute? gp2-24x224x2 provides 2 GPUs and 224GB RAM"
  default = "gp2-24x224x2"
}

variable "python_package_list" {
  description = "A comma separated list of the Python packages you wish to install in the environment. Jupyterlab is always installed. e.g. powerai,scipy,scikit-learn"
  default = "powerai"
}

variable "volume_name" {
  description = "Name of the block storage volume which will be used to persist data."
  default = "persistent-data-volume"
}

variable "volume_capacity" {
  description = "The size in GB of the block storage volume in which data and logs will be persisted."
  default = 100
}

data ibm_is_vpc "vpc" {
    name = "${var.vpc_basename}" 
}

data ibm_is_image "ubuntu" {
    name = "ibm-ubuntu-18-04-3-minimal-ppc64le-2"
}

#Create an SSH key which will be used for provisioning by this template, and for debug purposes
resource "ibm_is_ssh_key" "public_key" {
  name = "${var.vm_name}-public-key"
  public_key = "${tls_private_key.vision_keypair.public_key_openssh}"
}

#Create a public floating IP so that the app is available on the Internet
resource "ibm_is_floating_ip" "fip1" {
  name = "${var.vm_name}-subnet-fip1"
  target = "${ibm_is_instance.vm.primary_network_interface.0.id}"
}

resource "ibm_is_volume" "block_storage_volume" {
  name     = "${var.volume_name}"
  profile  = "general-purpose"
  zone     = "${var.vpc_zone}"
  capacity = "${var.volume_capacity}"
}

resource "ibm_is_instance" "vm" {
  name = "${var.vm_name}"
  image = "${data.ibm_is_image.ubuntu.id}"
  profile = "${var.vm_profile}"
  #224GBVM

  primary_network_interface {
    subnet = "${var.subnet_id}"
  }

  vpc = "${data.ibm_is_vpc.vpc.id}"
  zone = "${var.vpc_zone}"
  //make this a variable when there's more than one option...
  keys = [
    "${ibm_is_ssh_key.public_key.id}"
  ]

  volumes = [
      "${ibm_is_volume.block_storage_volume.id}"
  ]

  timeouts {
    create = "10m"
    delete = "10m"
  }

}

# Create a login password which will be used for the main PowerAI Vision application
resource "random_password" "wmlce_token" {
  length = 16
  special = true
  override_special = "!@_"
}

#Create a ssh keypair which will be used to provision code onto the system - and also access the VM for debug if needed.
resource "tls_private_key" "vision_keypair" {
  algorithm = "RSA"
  rsa_bits = "2048"
}

# Provision WMLCE  onto the system
resource "null_resource" "provisioners" {

  triggers = {
    vmid = "${ibm_is_instance.vm.id}"
  }

  provisioner "local-exec" {
    command = "pwd; find .; git status; git reset HEAD --hard; find ."
  }

  provisioner "file" {
    source = "scripts"
    destination = "/tmp"
    connection {
      type = "ssh"
      user = "root"
      agent = false
      timeout = "5m"
      host = "${ibm_is_floating_ip.fip1.address}"
      private_key = "${tls_private_key.vision_keypair.private_key_pem}"
    }
  }

  provisioner "file" {
    content = <<ENDENVTEMPL
#!/bin/bash -xe
export RAMDISK=/tmp/ramdisk
ENDENVTEMPL
    destination = "/tmp/scripts/env.sh"
    connection {
      type = "ssh"
      user = "root"
      agent = false
      timeout = "5m"
      host = "${ibm_is_floating_ip.fip1.address}"
      private_key = "${tls_private_key.vision_keypair.private_key_pem}"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "set -e",
      "chmod +x /tmp/scripts*/*",
      "/tmp/scripts/ramdisk_tmp_create.sh",
      "/tmp/scripts/wait_bootfinished.sh",
      "/tmp/scripts/install_gpu_drivers.sh",
      "/tmp/scripts/mount_block_store.sh",
      "/tmp/scripts/install_wmlce.sh ${random_password.wmlce_token.result} ${var.python_package_list}",
      "/tmp/scripts/ramdisk_tmp_destroy.sh",          
      "rm -rf /tmp/scripts"
    ]
    connection {
      type = "ssh"
      user = "root"
      agent = false
      timeout = "5m"
      host = "${ibm_is_floating_ip.fip1.address}"
      private_key = "${tls_private_key.vision_keypair.private_key_pem}"
    }
  }
    provisioner "file" {
    source = "scripts"
    destination = "/tmp"
    connection {
      type = "ssh"
      user = "root"
      agent = false
      timeout = "5m"
      host = "${ibm_is_floating_ip.fip1.address}"
      private_key = "${tls_private_key.vision_keypair.private_key_pem}"
    }
  }
}
