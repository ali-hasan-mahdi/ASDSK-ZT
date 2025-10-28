# Azure Secure DevOps Starter Kit — Zero-Trust Edition (ASDSK-ZT)

This project is an open-source reference for building a secure DevOps platform on Azure with Zero-Trust principles.

## What it does

- Deploys infrastructure using Terraform
- Runs CI/CD pipelines with GitHub Actions
- Builds, scans, and signs Docker containers
- Deploys Python and Java microservices on Kubernetes (AKS & k3d)
- Configures Linux dev environments with Ansible
- Uses PostgreSQL for secure data storage
- Automates developer workflows with Bash scripts
- Monitors everything with Azure Monitor, Log Analytics & Sentinel
- Enforces security policies and Zero-Trust identities

## How to use

1. Clone this repo  
2. Run `terraform apply` to create the infrastructure  
3. Follow the scripts in `/scripts` to start services and deploy apps  
4. Check monitoring and logs in Azure

## Tech stack

- Azure  
- Terraform  
- Kubernetes (AKS & k3d)  
- Ansible  
- Docker / Containers  
- GitHub Actions (CI/CD)  
- Python & Java  
- PostgreSQL  
- Bash scripting  
- Azure Monitor & Sentinel  

## Goal

Show a full production-ready DevSecOps setup on Azure. Everything is Infrastructure-as-Code and follows Zero-Trust security.

