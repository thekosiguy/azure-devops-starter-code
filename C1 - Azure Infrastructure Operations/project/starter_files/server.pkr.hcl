packer {
  required_plugins {
    azure = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/azure"
    }
  }
}

variable "client_id" {
  type    = string
  default = env("ARM_CLIENT_ID")
}

variable "client_secret" {
  type    = string
  default = env("ARM_CLIENT_SECRET")
  sensitive = true
}

variable "subscription_id" {
  type    = string
  default = env("ARM_SUBSCRIPTION_ID")
}

variable "image_resource_group_name" {
  description = "The name of the resource group where the custom image will be stored."
  type        = string
  default     = "Azuredevops"
}

source "azure-arm" "ubuntu" {
  client_id                         = var.client_id
  client_secret                     = var.client_secret
  subscription_id                   = var.subscription_id
  managed_image_resource_group_name = var.image_resource_group_name
  managed_image_name                = "packer-ubuntu-1804"
  os_type                           = "Linux"
  image_publisher                   = "Canonical"
  image_offer                       = "UbuntuServer"
  image_sku                         = "18.04-LTS"
  location                          = "eastus" # Changed to a commonly allowed region
  vm_size                           = "Standard_B1s" # Added to comply with potential VM size restrictions
  azure_tags = {
    "packer-build" = "true"
  }
}

build {
  sources = ["source.azure-arm.ubuntu"]

  provisioner "shell" {
    inline = [
      "echo 'Hello, World!' > index.html",
      "nohup busybox httpd -f -p 80 &",
    ]
    inline_shebang = "/bin/sh -x"
  }
}
