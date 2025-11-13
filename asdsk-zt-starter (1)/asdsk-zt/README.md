Azure Secure DevOps Starter Kit — Zero-Trust Edition (ASDSK-ZT)

This project is a practical DevSecOps reference environment designed to demonstrate how modern applications can be built, secured, deployed, and observed using Zero-Trust design principles.

The current milestone (Milestone 1) delivers a fully running local DevSecOps environment using Kubernetes (k3d), Helm, and two microservices.

What is implemented — Milestone 1
Local Kubernetes Platform (k3d)

Local Kubernetes cluster created using k3d

Managed via kubectl

Deployed using Helm charts

Two Microservices (Python + Java)

python-api (FastAPI)

java-api (Spring Boot)

Both containerized and deployed into Kubernetes

Both reachable locally via kubectl port-forward

Local PostgreSQL Database

Installed in Kubernetes using the Bitnami Helm chart

Accessible to services inside the cluster

Developer Automation Scripts

scripts/dev-up.sh sets up the complete local environment

Automates cluster creation and Helm deployments

Version Control & Documentation

All work versioned in GitHub

Documentation maintained in Confluence

Project Structure
apps/            # Python + Java microservices
helm/            # Helm charts
scripts/         # Local dev automation
infra/           # Terraform scaffold (not deployed yet)
ansible/         # Placeholder for dev-node bootstrap
observability/   # Future: Grafana / Prometheus / Loki
compose.yaml     # Optional Docker Compose setup

Quickstart (Local)

Prerequisites: Docker Desktop, WSL2, kubectl, Helm, k3d

./scripts/dev-up.sh

kubectl -n apps port-forward svc/python-api 8000:80
kubectl -n apps port-forward svc/java-api   8080:80

Test the endpoints:

curl http://localhost:8000/api/hello
curl http://localhost:8080/api/hello

Tech Stack (Current)

Docker

WSL2 (Ubuntu)

Kubernetes (k3d)

Helm

FastAPI (Python)

Spring Boot (Java)

PostgreSQL (Bitnami)

Bash scripting

GitHub (version control)

Confluence (documentation)

Long-Term Goal

ASDSK-ZT will evolve into a production-grade Zero-Trust DevSecOps platform including:

Observability (Grafana, Prometheus, Loki)

Container scanning (Trivy)

SBOM generation (Syft)

Image signing (Cosign with OIDC)

GitOps (ArgoCD)

Terraform provisioning of Azure resources (AKS, PostgreSQL, VNet)

Secrets management (Azure Key Vault or Vault)

Automated CI/CD deployments

Status

Milestone 1 completed:

Local Kubernetes cluster operational

Python and Java services deployed

PostgreSQL running inside the cluster

Services reachable locally via curl

Repository updated and documented

Next milestone: Observability stack (Grafana + Prometheus + Loki)
