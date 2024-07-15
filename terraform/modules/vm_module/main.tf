resource "vagrant_vm" "vm" {
  count = var.vm_count

  env = {
    VAGRANTFILE_HASH = md5(file(var.vagrantfile_path)),
    VM_CPUS          = var.vm_cpus,
    VM_MEMORY        = var.vm_memory,
    VM_NAME          = "${var.vm_name_prefix}-${count.index + 1}"
  }

  get_ports = true
}