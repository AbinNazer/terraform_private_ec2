# Terraform – Private EC2 with NAT Gateway, ALB & Strapi

## 📌 Project Overview

This project demonstrates deploying a **secure AWS infrastructure** using **Terraform** where a **Strapi application** runs on a **private EC2 instance** inside a custom **VPC**.

The application is accessed through an **Application Load Balancer (ALB)** placed in a public subnet, while the EC2 instance remains private and uses a **NAT Gateway** for outbound internet access.  
All infrastructure is created using **Infrastructure as Code (IaC)** with a **modular Terraform structure**.

---

## 🏗 Architecture
Internet
|
[ Application Load Balancer (Public Subnet) ]
|
[ Private EC2 (Docker + Strapi) ]
|
[ NAT Gateway ] → Internet (updates, Docker images)


---

## 🧰 Technologies Used

- AWS EC2
- AWS VPC
- Public & Private Subnets
- NAT Gateway
- Application Load Balancer (ALB)
- Terraform
- Docker
- Strapi CMS
- Ubuntu Linux

---

## 📂 Project Structure
terraform-strapi-private-ec2/
│
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── user_data.sh
│
└── modules/
├── vpc/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
│
├── security/
│ ├── main.tf
│ └── outputs.tf
│
├── ec2/
│ ├── main.tf
│ └── outputs.tf
│
└── alb/
├── main.tf
└── outputs.tf

---

## 🔐 Security Design

- **ALB Security Group**
  - Allows HTTP (Port 80) from anywhere

- **EC2 Security Group**
  - Allows Strapi (Port 1337) only from ALB
  - SSH (Port 22) restricted to a specific IP using tfvars

- **Private EC2**
  - No public IP assigned
  - Not directly accessible from the internet

---

## ⚙️ Automated Application Setup (User Data)

The EC2 instance uses a `user_data` script to automatically:

- Update the system
- Install Docker
- Start and enable Docker service
- Run Strapi using Docker

``bash
docker run -d -p 1337:1337 --name strapi strapi/strapi

---

🌍 Environment Configuration

All environment-specific values are managed using terraform.tfvars, including:

AWS region

VPC and subnet CIDR ranges

EC2 instance type

AMI ID

SSH key pair name

Allowed SSH CIDR

This allows easy reuse across multiple environments.

 ---

 🚀 Deployment Steps
terraform init
terraform plan
terraform apply
After deployment, the Strapi application can be accessed using the ALB DNS name from Terraform outputs.

📤 Outputs

Application Load Balancer DNS name

Resource IDs for verification

🧠 Key Learnings

Designing secure VPC architecture with public and private subnets

Using NAT Gateway for outbound internet from private instances

Exposing private applications securely using ALB

Automating application setup with user_data

Writing modular and reusable Terraform code

Managing infrastructure using tfvars

✅ Use Case

This architecture is suitable for:

Production-ready web applications

Secure backend services

DevOps and Cloud infrastructure demonstrations

