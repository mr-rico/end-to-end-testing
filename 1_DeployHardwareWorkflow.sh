# Apply resources
kubectl apply -f secrets/ilo-credentials.yaml
kubectl apply -f config/ilo-targets.yaml
kubectl apply -f scripts/ilo-check-script.yaml
kubectl apply -f workflows/ilo-hardware-health-workflow.yaml

# Run workflow
kubectl testkube run testworkflow ilo-hardware-health -n testkube

# checks each server’s iLO endpoint for:
## system health
## power state
## iLO overall health
## chassis health
## drive/storage health where available

