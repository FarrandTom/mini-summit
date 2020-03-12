output "wmlce_token" {
  value = "${random_password.wmlce_token.result}"
}

output "jupyterlab_url" {
    value = "http://${ibm_is_floating_ip.fip1.address}:443/lab"
}


output "vm_private_key" {
  value = "\n${tls_private_key.vision_keypair.private_key_pem}"
}
