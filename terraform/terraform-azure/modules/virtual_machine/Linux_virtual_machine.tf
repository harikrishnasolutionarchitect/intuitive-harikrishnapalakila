provider "azurerm" {
  #subscription_id = var.subscription_id
  features { }
}
terraform {
  backend "azurerm" {
    resource_group_name = "tfsate"
    storage_account_name = "halsa"
    container_name = "halcontainer.tfstate"
    
  }
}
data "azurerm_client_config" "curreny" {}

resource "azurerm_resource_group" "hal-logia-rg" {
  name     = "${var.prefix}-rg"
  location = var.location 
}
resource "azurerm_virtual_network" "hal-logia-vnet" {
  name                = "${var.prefix}-vnet"
  address_space       = var.address_space
  location            = azurerm_resource_group.hal-logia-rg.location
  resource_group_name = azurerm_resource_group.hal-logia-rg.name
}
resource "azurerm_subnet" "hal-logia-dev-internal" {
  name                 = "${var.prefix}-internal"
  resource_group_name  = azurerm_resource_group.hal-logia-rg.name
  virtual_network_name = azurerm_virtual_network.hal-logia-vnet.name
  address_prefixes     = var.address_prefixes
}
resource "azurerm_network_interface" "hal-logi-dev-nic" {
  name                = "${var.prefix}-nic"
  location            = azurerm_resource_group.hal-logia-rg.location
  resource_group_name = azurerm_resource_group.hal-logia-rg.name
  ip_configuration {
    name                          = var.nic_name
    subnet_id                     = azurerm_subnet.hal-logia-dev-internal.id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
}
resource "azurerm_virtual_machine" "hal-logia-dev-Linux-server" {
  for_each            = var.vm_instance_count 
  name                = "${var.prefix}-vm-${each.key}"
  location            = azurerm_resource_group.hal-logia-rg.location
  resource_group_name = azurerm_resource_group.hal-logia-rg.name
  network_interface_ids = [azurerm_network_interface.hal-logi-dev-nic[each.key].id]
  vm_size               = var.vm_size
  admin_username        = var.admin_username
  admin_ssh_key {
    username            = var.admin_username
    public_key          = file("${path.module}/ssh-keys/terraform-azure.pub")
  }
  delete_os_disk_on_termination = var.delete_os_disk_on_termination
  # delete_os_disk_on_termination = true
  # delete_data_disks_on_termination = true
  storage_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku 
    version   = var.version
  }
  storage_os_disk {
    name              = "${var.prefix}-os-${each.key}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.managed_disk_type
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = var.admin_username
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  resource "azurerm_managed_disk" "hal-logia-OS-disk" {
  count                = var.vm_instance_count
  name                 = "${var.prefix}-disk-${count.index}"
  location             = azurerm_resource_group.hal-logia-rg.location
  resource_group_name  = azurerm_resource_group.hal-logia-rg.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 100
}

resource "azurerm_virtual_machine_data_disk_attachment" "hal-logia-OS-disk_attachment" {
  managed_disk_id    = "${azurerm_managed_disk.hal-logia-OS-disk.id}"
  virtual_machine_id = "${azurerm_virtual_machine.hal-logia-dev-Linux-server.id}"
  lun                = "10"
  caching            = "ReadWrite"
}
  tags = {
    environment = "staging"
  }
}