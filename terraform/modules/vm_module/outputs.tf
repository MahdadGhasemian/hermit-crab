output "machine_names" {
  value = [for i in range(var.vm_count) : vagrant_vm.vm[i].machine_names[0]]
}

output "host_ports" {
  value = [for i in range(var.vm_count) : vagrant_vm.vm[i].ports[0][0].host]
}

output "ssh_host_ports" {
  value = [for i in range(var.vm_count) :
    "${vagrant_vm.vm[i].ssh_config[0].host}:${vagrant_vm.vm[i].ssh_config[0].port}"
  ]
}
