# ☁️ b18_G79Sheetal — Azure Infrastructure with Terraform 🚀

> ⚡ **Automated, Modular, & Multi-Environment Azure Cloud Infrastructure Provisioning**

This repository contains modularized **HashiCorp Terraform** code designed to systematically provision and manage Azure infrastructure across isolated environments (**Pre-Production** 🧪 and **Production** 🏭).

---

## 📁 Repository Structure

```tree
b18_G79Sheetal/
├── 📄 .gitignore               # 🙈 Git ignore rules for state files & secrets
├── 📄 README.md                # 📖 Project documentation
├── 📂 enviornment/             # 🌍 Environment-specific deployment configurations
│   ├── 📂 prepod/              # 🧪 Pre-Production environment
│   │   ├── ⚙️ main.tf          # 🧩 Module invocations for pre-prod
│   │   └── 📝 terraform.tfvars # 🎛️ Pre-prod input parameter values
│   └── 📂 prod/                # 🏭 Production environment
│       ├── ⚙️ main.tf          # 🧩 Module invocations for prod
│       └── 📝 terraform.tfvars # 🎛️ Prod input parameter values
└── 📂 modules/                 # 📦 Reusable Terraform Infrastructure Modules
    ├── 📂 resource_group/      # 🏗️ Azure Resource Group module
    │   ├── ⚙️ main.tf          # ⚡ Resource Group definition
    │   └── 📝 variable.tf      # 📥 Module input declaration
    └── 📂 storage_account/     # 💾 Azure Storage Account module
        ├── ⚙️ main.tf          # ⚡ Storage Account resource definition
        └── 📝 variable.tf      # 📥 Module input declaration
```

---

## 📦 Reusable Infrastructure Modules

### 1. 🏗️ Resource Group Module (`modules/resource_group`)
* ⚡ **Azure Resource**: `azurerm_resource_group`
* 🔄 **Dynamic Provisioning**: Uses `for_each` loops to provision single or multiple resource groups dynamically from input maps.
* 📥 **Inputs**: Name and target Azure location.

### 2. 💾 Storage Account Module (`modules/storage_account`)
* ⚡ **Azure Resource**: `azurerm_storage_account`
* 🔄 **Dynamic Provisioning**: Dynamically provisions storage accounts linked to target Resource Groups.
* 📥 **Inputs**: Storage account name, location, parent resource group name, account tier (`Standard`/`Premium`), and replication type (`LRS`/`GRS`).

---

## 🌍 Multi-Environment Configuration Matrix

| 🌐 Environment | 🏗️ Resource Group | 💾 Storage Account | 📊 Tier | 🔁 Replication | 📍 Region |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 🧪 **Pre-Production (`prepod`)** | `sheetalrgprepod` | `myboxshprepod` | `Standard` | `LRS` | `westus` / `eastus` |
| 🏭 **Production (`prod`)** | `sheetalrgprod` | `myboxshprod` | `Standard` | `LRS` | `westus` / `eastus` |

---

## ⚙️ Prerequisites & Setup

Before running the Terraform deployment, verify you have the following installed & configured:

* 🛠️ **[Terraform CLI](https://developer.hashicorp.com/terraform/downloads)** `(v1.0+)`
* 💻 **[Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)**
* 💳 Active **Azure Subscription**

### 🔐 Authenticate with Azure
Login to your Azure account before running Terraform commands:

```bash
az login
```

---

## 🚀 Step-by-Step Deployment Guide

### 📍 Step 1: Navigate to Target Environment
Choose the target environment folder:

```bash
# 🧪 Navigate to Pre-Production:
cd enviornment/prepod

# 🏭 OR Navigate to Production:
cd enviornment/prod
```

### ⚙️ Step 2: Initialize Terraform
Initialize the working directory and download provider dependencies:

```bash
terraform init
```

### 🔍 Step 3: Preview Execution Plan
Perform a dry-run to preview resources that will be created:

```bash
terraform plan
```

### ✨ Step 4: Apply & Provision Infrastructure
Deploy resources to Azure:

```bash
terraform apply
```

---

## 💡 Key Architectural Concepts & Best Practices

* 📦 **Modular Infrastructure**: Clean separation between reusable module logic (`modules/`) and execution environments (`enviornment/`).
* 🔄 **Dynamic Resource Mapping**: Utilizing `for_each` meta-arguments for scalable, data-driven resource instantiation.
* 🔗 **Explicit Module Dependencies**: Implementing `depends_on = [module.rg]` to enforce deterministic ordering (Resource Group created before Storage Account).
* 🛡️ **State & Environment Isolation**: Completely separated execution contexts preventing accidental cross-environment modifications.


