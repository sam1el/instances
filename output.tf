output "main_public_ip" {
  value = module.webserver.*.vm_public_ip
}

output "loadbalancer_vm_public_ip" {
  value = module.loadbalancer.*.vm_public_ip
}
