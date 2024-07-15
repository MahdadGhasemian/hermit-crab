module "master_vms" {
  source           = "./modules/vm_module"
  vm_count         = var.vm_master_count
  vm_cpus          = var.vm_cpus
  vm_memory        = var.vm_memory
  vm_name_prefix   = "master"
  vagrantfile_path = var.vagrantfile_path
}

module "worker_vms" {
  source           = "./modules/vm_module"
  vm_count         = var.vm_worker_count
  vm_cpus          = var.vm_cpus
  vm_memory        = var.vm_memory
  vm_name_prefix   = "worker"
  vagrantfile_path = var.vagrantfile_path
}
