variable "vm_master_count" {
  description = "Number of Master VMs to create"
  type        = number
  default     = 1
}

variable "vm_worker_count" {
  description = "Number of Worker VMs to create"
  type        = number
  default     = 2
}

variable "vm_cpus" {
  description = "Number of CPUs per VM"
  type        = number
  default     = 1
}

variable "vm_memory" {
  description = "Memory size for each VM in MB"
  type        = number
  default     = 1024
}

variable "vagrantfile_path" {
  description = "Path to the Vagrantfile"
  type        = string
  default     = "./Vagrantfile"
}
