# Apply resources
kubectl apply -f node-os-rbac.yaml
kubectl apply -f node-os-health-script.yaml
kubectl apply -f node-os-health-workflow.yaml

# Run workflow
kubectl testkube run testworkflow node-os-health -n testkube


# This workflow is useful for detecting:
## nodes technically present but unhealthy underneath
## disks nearly full
## inode exhaustion
## kubelet stopped
## runtime socket missing
## failed systemd services
## low available memory
## suspicious recent OS log entries

# Improvement options
## per-node execution so you know exactly which node failed
## explicit checks for your OS standard, like RHEL package/service expectations
## checks for CSI mount paths and storage device presence
## checks for NTP daemon state specific to your distro
## checks for NIC/bond health if your physical servers use bonded interfaces
## checks for GPU services if some nodes have accelerators

