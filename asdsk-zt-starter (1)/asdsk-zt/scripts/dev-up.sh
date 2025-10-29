#!/usr/bin/env bash
set -euo pipefail

CLUSTER=asdsk
echo ">> Checking dependencies (docker, kubectl, k3d, helm)..."
command -v docker >/dev/null || { echo "docker is required"; exit 1; }
command -v kubectl >/dev/null || { echo "kubectl is required"; exit 1; }
command -v k3d >/dev/null || { echo "k3d is required (https://k3d.io)"; exit 1; }
command -v helm >/dev/null || { echo "helm is required"; exit 1; }

if ! k3d cluster list | grep -q "^${CLUSTER}\b"; then
  echo ">> Creating k3d cluster ${CLUSTER}"
  k3d cluster create ${CLUSTER} --servers 1 --agents 2
fi

echo ">> Creating namespaces"
kubectl create ns apps --dry-run=client -o yaml | kubectl apply -f -
kubectl create ns data --dry-run=client -o yaml | kubectl apply -f -

echo ">> Installing PostgreSQL (Bitnami) into data namespace"
helm repo add bitnami https://charts.bitnami.com/bitnami >/dev/null
helm repo update >/dev/null
helm upgrade --install pg bitnami/postgresql \
  --namespace data \
  --set auth.username=appuser \
  --set auth.password=apppass \
  --set auth.database=appdb

echo ">> Building images and loading into k3d"
docker build -t python-api:dev ./apps/python-api
docker build -t java-api:dev ./apps/java-api
k3d image import -c ${CLUSTER} python-api:dev java-api:dev

echo ">> Deploying Helm charts"
helm upgrade --install python-api ./helm/python-api -n apps --set image.repository=python-api --set image.tag=dev
helm upgrade --install java-api ./helm/java-api -n apps --set image.repository=java-api --set image.tag=dev

echo ">> All set. Try:"
echo "kubectl get pods -A"
