output "wmlce_token" {
  value = "${random_password.wmlce_token.result}"
}

output "wmlce_url" {
    value = "https://${ibm_is_floating_ip.fip1.address}:443/token"
}

output "vm_private_key" {
  value = "\n${tls_private_key.vision_keypair.private_key_pem}"
}
