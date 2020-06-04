output "main_public_ip" {
  value = module.webserver.*.vm_public_ip
}
