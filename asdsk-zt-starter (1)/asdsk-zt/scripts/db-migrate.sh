#!/usr/bin/env bash
set -euo pipefail
DB_HOST=${DB_HOST:-localhost}
DB_PORT=${DB_PORT:-5432}
DB_USER=${DB_USER:-appuser}
DB_PASS=${DB_PASS:-apppass}
DB_NAME=${DB_NAME:-appdb}

export PGPASSWORD="$DB_PASS"
psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -f ./apps/python-api/migrations/001_init.sql
