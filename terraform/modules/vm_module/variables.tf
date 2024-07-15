variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
}

variable "vm_cpus" {
  description = "Number of CPUs per VM"
  type        = number
}

variable "vm_memory" {
  description = "Memory size for each VM in MB"
  type        = number
}

variable "vm_name_prefix" {
  description = "Prefix for VM names"
  type        = string
}

variable "vagrantfile_path" {
  description = "Path to the Vagrantfile"
  type        = string
}
