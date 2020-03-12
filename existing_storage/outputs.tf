output "wmlce_token" {
  value = "${random_password.wmlce_token.result}"
}

output "vm_private_key" {
  value = "\n${tls_private_key.vision_keypair.private_key_pem}"
}
