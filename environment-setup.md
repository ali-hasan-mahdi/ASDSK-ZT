# Azure Secure DevOps Starter Kit — Zero-Trust Edition (ASDSK-ZT)

## Projektöversikt
**ASDSK-ZT** är en öppen referensplattform för DevSecOps på Azure.  
Målet är att visa hur man kan bygga, säkra, driftsätta och övervaka moderna applikationer enligt **Zero-Trust-principer** – från kod till drift.

Projektet körs lokalt via **Docker + k3d (Kubernetes)** och innehåller exempel på **mikrotjänster i Python och Java**, CI/CD-struktur och IaC-ramverk (Terraform, Ansible, Helm).

---

## Miljö och verktyg

### Installerade komponenter
| Verktyg | Version | Användning |
|----------|----------|-------------|
| **Docker** | 24.0.7 | Kör containers |
| **Kubectl** | – | Hanterar Kubernetes |
| **k3d** | 5.8.3 | Lättvikts Kubernetes i Docker |
| **Helm** | – | Hanterar deploy charts |
| **Maven** | via Docker | Bygger Java-applikationer |
| **WSL2** | Ubuntu | Linux-miljö på Windows |

### Installation av k3d
```bash
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
