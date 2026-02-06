Terraform – Private EC2 with NAT Gateway, ALB & Strapi
📌 Project Overview

This project demonstrates how to deploy a secure, production-style AWS architecture using Terraform.
A Strapi application is hosted on a private EC2 instance inside a custom VPC, with controlled access through an Application Load Balancer (ALB) and outbound internet access via a NAT Gateway.

All infrastructure is provisioned using Infrastructure as Code (IaC) following modular Terraform best practices.

🏗 Architecture
Internet
   |
[ Application Load Balancer ]
   |
[ Private EC2 (Docker + Strapi) ]
   |
[ NAT Gateway ] → Internet (updates, Docker images)

Key Design Points

EC2 instance does not have a public IP

Only the ALB is exposed to the internet

Outbound traffic from private EC2 goes through NAT Gateway

Docker is installed automatically using user_data

Environment values are managed via terraform.tfvars

🧰 Technologies Used

AWS EC2

AWS VPC

Application Load Balancer (ALB)

NAT Gateway

Terraform

Docker

Strapi CMS

Ubuntu Linux

📂 Project Structure
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
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    ├── security/
    │   ├── main.tf
    │   └── outputs.tf
    │
    ├── ec2/
    │   ├── main.tf
    │   └── outputs.tf
    │
    └── alb/
        ├── main.tf
        └── outputs.tf

🔐 Security Design

ALB Security Group

Allows HTTP (80) from 0.0.0.0/0

EC2 Security Group

Allows Strapi port 1337 only from ALB

SSH access restricted to a specific IP (defined in tfvars)

Private EC2

No public IP assigned

Accessible only via ALB or SSH (controlled CIDR)

⚙️ Automated Application Setup (User Data)

The EC2 instance uses user_data.sh to automatically:

Update the system

Install Docker

Start Docker service

Run Strapi using Docker

docker run -d -p 1337:1337 --name strapi strapi/strapi

🌍 Environment Configuration

All environment-specific values are managed using terraform.tfvars, including:

AWS Region

VPC & Subnet CIDRs

EC2 instance type

AMI ID

SSH key name

Allowed SSH CIDR

This makes the setup reusable across dev / test / prod environments.

🚀 How to Deploy
terraform init
terraform plan
terraform apply


After deployment, access the application using the ALB DNS name from Terraform outputs.

📤 Outputs

ALB DNS Name – Used to access the Strapi application

VPC and resource IDs for verification

🧠 What I Learned

Designing secure AWS networking using public & private subnets

Implementing NAT Gateway for private resource internet access

Exposing private services securely using ALB

Automating application deployment with user_data

Writing modular, reusable Terraform code

Managing environments using tfvars

✅ Use Case

This architecture is suitable for:

Production-ready web applications

Secure backend services

Microservices hosted in private subnets

DevOps & Cloud engineering demonstrations
