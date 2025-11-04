## Projects

This repository is structured into multiple projects, each corresponding to a course in the Nanodegree program.

*   **C1 - Azure Infrastructure Operations**: This project focuses on deploying a scalable IaaS web server in Azure using Packer and Terraform.
*   **C2 - Agile Development with Azure**: This project involves setting up a CI/CD pipeline for a machine learning application using Azure Pipelines.

---

## C1: Deploying a Scalable IaaS Web Server in Azure

This project demonstrates the use of Infrastructure as Code (IaC) to provision a web server on Azure.

### Getting Started

The code for this project is located in the `C1 - Azure Infrastructure Operations/project/starter_files/` directory. Before you begin, ensure you have the following dependencies installed and configured:

*   An active Azure Account
*   Azure CLI
*   Packer
*   Terraform

You will also need to be logged into your Azure account via the Azure CLI:
```bash
az login
```

### Instructions

1.  **Build a custom VM image with Packer:**
    Navigate to the Packer directory and initialize Packer. Then, build the image. You will need to provide your Azure Subscription ID.

    ```bash
    cd "C1 - Azure Infrastructure Operations/project/starter_files/packer"
    packer init .
    packer build -var "azure_subscription_id=<Your-Azure-Subscription-ID>" web-server.pkr.hcl
    ```

2.  **Deploy infrastructure with Terraform:**
    Navigate to the Terraform directory. Initialize Terraform, validate the configuration, and then apply it to create the Azure resources.

    ```bash
    cd ../terraform
    terraform init
    terraform validate
    terraform apply
    ```
    Terraform will prompt you for your Azure Subscription ID and ask for confirmation before provisioning the resources.

### Customization

You can customize the deployment by modifying the `variables.tf` file located in the `terraform` directory. This file allows you to change parameters such as the resource group name, location, VM size, and the name of the custom image created by Packer.

### Expected Output

After running `terraform apply`, Terraform will provision the necessary Azure resources. Upon successful completion, it will display the public IP address of the deployed web server as an output. You can use this IP address to access your web server in a browser.

```
Apply complete! Resources: 4 added, 0 changed, 0 destroyed.

Outputs:

public_ip_address = "20.123.45.67"
```