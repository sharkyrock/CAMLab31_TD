#####################################################################
##
##      Created 9/11/19 by ucdpadmin. for project2
##
#####################################################################

variable "user" {
  type = "string"
  description = "Generated"
}

variable "password" {
  type = "string"
  description = "Generated"
}

variable "vsphere_server" {
  type = "string"
  description = "Generated"
}

variable "allow_unverified_ssl" {
  type = "string"
  description = "Generated"
}

variable "app_server_name" {
  type = "string"
  description = "Virtual machine name for app_server"
}

variable "app_server_number_of_vcpu" {
  type = "string"
  description = "Number of virtual cpu's."
}

variable "app_server_memory" {
  type = "string"
  description = "Memory allocation."
}

variable "app_server_disk_name" {
  type = "string"
  description = "The name of the disk. Forces a new disk if changed. This should only be a longer path if attaching an external disk."
}

variable "app_server_disk_size" {
  type = "string"
  description = "The size of the disk, in GiB."
}

variable "app_server_template_name" {
  type = "string"
  description = "Generated"
}

variable "app_server_datacenter_name" {
  type = "string"
  description = "Generated"
}

variable "app_server_datastore_name" {
  type = "string"
  description = "Generated"
}

variable "app_server_resource_pool" {
  type = "string"
  description = "Resource pool."
}

variable "db_server_name" {
  type = "string"
  description = "Virtual machine name for db_server"
}

variable "db_server_number_of_vcpu" {
  type = "string"
  description = "Number of virtual cpu's."
}

variable "db_server_memory" {
  type = "string"
  description = "Memory allocation."
}

variable "db_server_disk_name" {
  type = "string"
  description = "The name of the disk. Forces a new disk if changed. This should only be a longer path if attaching an external disk."
}

variable "db_server_disk_size" {
  type = "string"
  description = "The size of the disk, in GiB."
}

variable "db_server_template_name" {
  type = "string"
  description = "Generated"
}

variable "db_server_datacenter_name" {
  type = "string"
  description = "Generated"
}

variable "db_server_datastore_name" {
  type = "string"
  description = "Generated"
}

variable "network_network_name" {
  type = "string"
  description = "Generated"
}

