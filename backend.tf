terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "tfstate245324218"
    container_name       = "tfstate"
    key                  = "keyvault/terraform.tfstate"
    use_azuread_auth     = true
  }
}
