# Azure Secure DevOps Starter Kit — Zero‑Trust Edition (ASDSK‑ZT)

An open‑source DevSecOps reference platform that shows how to build, secure, deploy and observe modern apps on Azure with **Zero‑Trust** as the design principle.

## What’s inside (v0 scaffold)

- **apps/**
  - `python-api/` (FastAPI demo service)
  - `java-api/` (Spring Boot demo service)
- **infra/**
  - `terraform/` (Azure skeleton for RG + placeholders for AKS, PostgreSQL + Private Endpoint, Managed Identity)
- **ansible/**
  - `playbooks/dev-node-bootstrap.yml` (provisions a Linux dev node)
- **helm/**
  - Helm charts for both services + shared values
- **.github/workflows/**
  - `ci.yml` — build → SBOM (syft) → scan (trivy) → sign (cosign, keyless via OIDC) → push to GHCR
- **scripts/**
  - `dev-up.sh` local developer bootstrap (k3d, helm, postgres dev via Helm)
  - `db-migrate.sh` simple psql migration runner
- **compose.yaml**
  - Local fallback: python-api + java-api + postgres + prometheus + node-exporter

> This scaffold is intentionally minimal and “policy ready”. The Terraform/AKS/MI wiring is stubbed for Sprint 1.

## Quickstart (local)

```bash
# 1) Optional: run locally with Docker Compose
docker compose up --build

# 2) Or create a local k3d cluster and deploy with Helm
./scripts/dev-up.sh
```

## CI: keyless signing & SBOM

The GitHub Actions workflow expects:
- GHCR write permission enabled in repo settings
- Actions → Workflow permissions: "Read and write"
- `permissions:` block in the workflow grants `id-token: write` for OIDC keyless signing

You’ll see Trivy results and attach SBOM artifacts on each push.

## Next sprints

1. **Terraform**: Azure PostgreSQL Flexible Server + Private Endpoint + Managed Identity
2. **Helm**: production values + ingress + network policies
3. **CI/CD**: environment‑specific deploy jobs + policy checks
4. **App**: JWT validation + RBAC in Python & Java
5. **Observability**: Azure Monitor/Log Analytics + Sentinel integration
