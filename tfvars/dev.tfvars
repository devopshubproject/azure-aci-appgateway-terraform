# General

environment = "dev"

# Network

vnet_name       = "aci-vnet"
vnet_rg_name    = "aci-vnet-rg"
pvt_subnet_name = ""
pub_subnet_name = ""
ipconf_name     = ""

# App Gateway

tier = "Standard_v2"
sku  = "Standard_v2"

# ACI details
#dns_name_label = 
os_type         = "Linux"
container_name  = "devopscafe"
image_name      = "microsoft/aci-helloworld:latest"
cpu_core_number = 0.5
memory_size     = 1.5
port_number     = 80
dns_name_label  = "acipvt"
