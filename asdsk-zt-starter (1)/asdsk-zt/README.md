# Azure Secure DevSecOps Starter Kit — Zero-Trust Edition (ASDSK-ZT)

En komplett DevSecOps-referensplattform som visar hur man bygger, säkrar, driftsätter och övervakar moderna applikationer med Zero-Trust som grundprincip – från kod till drift.

Detta projekt används för att demonstrera praktisk kompetens inom:
- DevOps
- Kubernetes
- CI/CD
- Observability
- Infrastructure as Code
- DevSecOps och supply-chain säkerhet
- Cloud-native arkitektur (Azure)

---

## 🔍 Syfte

Projektets syfte är att skapa en **reproducerbar, säker och automatiserad DevSecOps-plattform** som kör:

- mikrotjänster i Python & Java  
- Kubernetes (k3d lokalt / AKS framöver)  
- CI/CD med scanning, signering & SBOM  
- Helm-baserad deployment  
- Infrastruktur som kod (Terraform)  
- Observability (Prometheus/Grafana/Loki – kommande)

Denna plattform används som **portfolio-projekt** i jobbsök för DevOps Engineer-roller.

---

## 📦 Projektstruktur

```txt
apps/
  python-api/     # FastAPI mikrotjänst
  java-api/       # Spring Boot mikrotjänst
infra/
  terraform/      # Azure — AKS, PostgreSQL, nätverk (planerat)
ansible/
  playbooks/      # Dev-node provisioning
helm/
  python-api/     # Helm chart
  java-api/       # Helm chart
.github/workflows/
  ci.yml          # Build → scan → SBOM → sign → push (planerat att utökas)
scripts/
  dev-up.sh       # Skapar k3d-kluster + deployar allt lokalt
  db-migrate.sh   # Test-migrationer (placeholder)
compose.yaml      # Alternativ: köra allt utan Kubernetes
