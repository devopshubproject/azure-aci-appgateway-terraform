# General

environment = "dev"

# Network

vnet_name    = ""
vnet_rg_name = ""
subnet_name  = ""
ipconf_name  = ""

# App Gateway

tier = "Standard_v"
sku  = "Standard_v2"

# ACI details
#dns_name_label = 
os_type         = "Linux"
container_name  = "devopscafe"
image_name      = "microsoft/aci-helloworld:latest"
cpu_core_number = 0.5
memory_size     = 1.5
port_number     = 80
