data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "kv_rg" {
  name     = "keyvault-demo-rg"
  location = "japaneast"
}

resource "azurerm_key_vault" "kv" {
  name                      = "kv-security-demo"
  location                  = azurerm_resource_group.kv_rg.location
  resource_group_name       = azurerm_resource_group.kv_rg.name
  tenant_id                 = data.azurerm_client_config.current.tenant_id
  sku_name                  = "standard"
  rbac_authorization_enabled = true
  soft_delete_retention_days = 90
  purge_protection_enabled   = true
  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
    ip_rules       = []
  }
}
