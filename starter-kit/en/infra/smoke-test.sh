#!/bin/sh
# Smoke test: does the app answer over the internet, with valid HTTPS?
# Usage, from your computer: sh infra/smoke-test.sh yourdomain.com
set -eu
for route in /api/health /api/ready /; do
  if curl -fsS --max-time 10 -o /dev/null "https://$1$route"; then
    echo "ok     $route"
  else
    echo "FAILED $route: roll back (docs/runbooks/rollback.md)"
    exit 1
  fi
done
