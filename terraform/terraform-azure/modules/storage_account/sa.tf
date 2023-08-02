resource "azurerm_storage_account" "hal-logi-sa" {
  name                     = var.sa_name
  resource_group_name      = data.azurerm_resource_group.hal-logia-rg.name
  location                 = data.azurerm_resource_group.hal-logia-rg.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = {
    environment = var.env
  }
}