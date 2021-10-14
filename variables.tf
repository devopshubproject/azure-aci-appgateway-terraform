##### Global Variable #####

#### Tags ####
variable "owner" {
  type        = "string"
  description = "The name of the infra provisioner or owner"
  default     = "Prem"
}
variable "environment" {
  type        = "string"
  description = "The environment name"
}
variable "cost_center" {
  type        = "string"
  description = "The cost_center name for this project"
  default     = "personal budget"
}
variable "app_name" {
  type        = "string"
  description = "Application name of project"
  default     = "rd"
}
variable "location" {
  type        = "string"
  description = "The Location for Infra centre"
  default     = "West Europe"
}

### Network ###
variable "vnet_name" {
  type        = "string"
  description = "The core network environment vnet name"
}
variable "vnet_rg_name" {
  type        = "string"
  description = "The core network vnet resource group name"
}
variable "subnet_name" {
  type        = "string"
  description = "The cluster network subnet resource name"
}

variable "ipconf_name" {
  type        = "string"
  description = "The nic name for the compute resource"
}

### Host Pool ###
variable "host_pool_type" {
  type    = string
  default = "Pooled"
}

variable "host_pool_load_balancer_type" {
  type    = string
  default = "BreadthFirst"
}

variable "host_pool_validate_environment" {
  type    = bool
  default = false
}

variable "host_pool_max_sessions_allowed" {
  type    = number
  default = 999999
}

### Desktop App group ###
variable "desktop_app_group_type" {
  type    = string
  default = "Desktop"
}

### Share Image Gallery ###

variable "tier" {
  type        = string
  description = "The Offer Name for the Image"
}

variable "sku" {
  type        = string
  description = "The Name of the SKU for the Image."
}

### ACI Details ###

# variable "dns_name_label" {
#   description   = "The DNS label/name for the container groups IP"
# }

variable "os_type" {
  type        = "string"
  description = "The OS for the container group. Allowed values are Linux and Windows"
}

variable "container_name" {
  type        = "string"
  description = "The name of the container"
}

variable "image_name" {
  type        = "string"
  description = "The container image name"
}

variable "cpu_core_number" {
  description = "The required number of CPU cores of the containers"
}

variable "memory_size" {
  description = "The required memory of the containers in GB"
}

variable "port_number" {
  description = "A public port for the container"
}