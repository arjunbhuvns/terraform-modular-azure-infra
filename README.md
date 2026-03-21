🚀 Terraform Azure Infrastructure (Key-Based Design)
This project demonstrates a modular Terraform setup to provision end-to-end Azure infrastructure using key-based mapping and for_each.


terraform-azure-infra/
│
├── env/
│   └── dev/
|        ├── provider.tf
│       ├── main.tf
│       ├── variables.tf
│       ├── terraform.tfvars
│       └── backend.tf
├── modules/
│   ├── rg/
│   ├── storage/
│   ├── vnet/
│   ├── subnet/
│   ├── public_ip/
│   ├── nic/
│   ├── vm/
│   ├── nsg/
│   └── nsg-association/
│
└── README.md 


# 🚀 Terraform Azure Infrastructure (Key-Based Design)

This project demonstrates a modular Terraform setup to provision end-to-end Azure infrastructure using **key-based mapping and for_each**.

---

## 🧱 Infrastructure Created

- Resource Group
- Storage Account
- Virtual Network (VNet)
- Subnets (Frontend & Backend)
- Public IPs
- Network Interfaces (NICs)
- Virtual Machines (VMs)
- Network Security Groups (NSGs)
- NSG Associations

---

## 🔥 Key Features

- 🔁 Dynamic resource creation using `for_each`
- 🔗 Key-based mapping (NIC ↔ Subnet ↔ Public IP)
- 🧩 Modular Terraform architecture
- 🔐 Secure access using NSG rules

---

## 🧠 Architecture
RG
↓
VNet
↓
Subnets
↓
NICs ← Public IPs
↓
VMs
↓
NSG + Association
