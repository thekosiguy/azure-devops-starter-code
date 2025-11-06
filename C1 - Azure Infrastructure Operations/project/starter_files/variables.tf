# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "subscription_id" {
   description = "The Azure subscription ID to use."
}
variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
}

variable "admin_username" {
  description = "The admin username for the VM being created."
}

variable "admin_password" {
  description = "The password for the VM being created."
}

variable "instance_count" {
  description = "The number of virtual machines to create."
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "The size of the virtual machines to create."
  type        = string
  default     = "Standard_D2s_v3"
}

variable "image_publisher" {
  description = "The publisher of the source image for the virtual machine."
  type        = string
  default     = "Canonical"
}

variable "image_offer" {
  description = "The offer of the source image for the virtual machine."
  type        = string
  default     = "UbuntuServer"
}

variable "image_sku" {
  description = "The SKU of the source image for the virtual machine."
  type        = string
  default     = "18.04-LTS"
}

variable "image_version" {
  description = "The version of the source image for the virtual machine."
  type        = string
  default     = "latest"
}