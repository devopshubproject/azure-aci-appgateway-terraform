### ACI details ###

output "aci_id" {
  description = "The ID of the created container group"
  value       = azurerm_container_group.aci.id
}

output "aci_ip_addr" {
  description = "The IP address of the created container group"
  value       = azurerm_container_group.aci.ip_address
}

output "aci_fqdn" {
  description = "The FQDN of the created container group"
  value       = azurerm_container_group.aci.fqdn
}