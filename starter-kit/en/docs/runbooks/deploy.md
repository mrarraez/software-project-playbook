# Runbook — Deploy a release (~10 min)

Prerequisites: tag vX.Y.Z created and images published by release-images;
VPS prepared and first-deploy checklist done (Part 05, "Live, on a VPS").

1. Note the version that is live: grep VERSION .env
2. Change VERSION in .env to the new tag (e.g., VERSION=v1.3.0).
3. Pull the images and bring them up without building:
   docker compose --profile app pull
   docker compose --profile app up -d --no-build
4. Check from the inside: docker compose --profile app ps (all healthy).
5. Check from the outside, from your computer: sh infra/smoke-test.sh <domain>
6. Failed? Follow rollback.md now; investigate afterwards.
7. Record it in the DECISION-LOG:
   date | previous version | new version | smoke test result.
