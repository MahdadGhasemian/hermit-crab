output "master_machine_names" {
  value = module.master_vms.machine_names
}

output "master_host_ports" {
  value = module.master_vms.host_ports
}

output "master_ssh_host_port" {
  value = module.master_vms.ssh_host_ports
}

output "worker_machine_names" {
  value = module.worker_vms.machine_names
}

output "worker_host_ports" {
  value = module.worker_vms.host_ports
}

output "worker_ssh_host_port" {
  value = module.worker_vms.ssh_host_ports
}
