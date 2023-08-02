variable "prefix" {
  default = "hal-logia-dev"
}
variable "location" {
   ddefault = [ "West Europe" ] 
}
variable "fmcna-vm" {
   type = string 
   default = "hal-logia-dev00"
}
variable "subscription_id" {
    default = "preprod"  
}
variable "address_space" {
    default = ["10.13.0.0/26"]
  
}
variable "address_prefixes" {
    default =  ["10.13.1.0/29"]
  
}
variable "nic_name" {
    default = [ "hal-logi-dev-nic" ] 
}
variable "private_ip_address_allocation" {
    default = [ "Dynamic" ]
  
}
variable "vm_size" {
    default = [ "Standard_F4" ]
  
}
variable "admin_username" {
    default = [ "NVMUMAPI" ]
}
variable "delete_os_disk_on_termination" {
    type = bool 
    default = true  
}
variable "publisher" {
  default = [ "RedHat" ]
}
variable "offer" {
    default = [ "RHEL" ]
  
}
variable "sku" {
    default = ["83-gen2"]
  
}
variable "version" {
    default = [ "latest" ]
}
variable "managed_disk_type" {
    default = [ "Standard_LRS" ]
}
variable "vm_instance_count"   {   default = ["hal-logia-vm-dev-01", "hal-logia-vm-dev-02"] }
variable "vm_ebs_volume_count" {   default = 3                                              }
variable "vm_device_names"     {   default = [ "/dev/sdd", "/dev/sde", "/dev/sdf" ]         }
variable "vm_ebs_volume_size"  {   default = 150                                            }