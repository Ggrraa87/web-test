#!/usr/bin/env bash
# Read-only snapshot of the cluster for the node-reduction analysis.
# Usage: KUBECONFIG=./twc-kam-ml-config.yaml ./collect.sh  -> creates report-<date>.tar.gz
set -u
OUT="report-$(date +%Y%m%d-%H%M)"; mkdir -p "$OUT"

kubectl version                                   >"$OUT/version.txt" 2>&1
kubectl get nodes -o wide --show-labels           >"$OUT/nodes.txt" 2>&1
kubectl describe nodes                            >"$OUT/nodes-describe.txt" 2>&1
kubectl top nodes                                 >"$OUT/top-nodes.txt" 2>&1
kubectl top pods -A --sort-by=memory              >"$OUT/top-pods.txt" 2>&1
kubectl get pods -A -o wide                       >"$OUT/pods.txt" 2>&1
kubectl get deploy,sts,ds,job,cronjob -A -o wide  >"$OUT/workloads.txt" 2>&1
kubectl get pdb,hpa -A                            >"$OUT/pdb-hpa.txt" 2>&1
kubectl get pv,pvc,sc -A -o wide                  >"$OUT/storage.txt" 2>&1
kubectl get svc -A -o wide                        >"$OUT/services.txt" 2>&1
kubectl get ingress -A                            >"$OUT/ingress.txt" 2>&1
kubectl get ns                                    >"$OUT/namespaces.txt" 2>&1
helm list -A                                      >"$OUT/helm.txt" 2>&1 || true

# Requests/limits per pod and node placement
kubectl get pods -A -o custom-columns='NS:.metadata.namespace,POD:.metadata.name,NODE:.spec.nodeName,CPU_REQ:.spec.containers[*].resources.requests.cpu,MEM_REQ:.spec.containers[*].resources.requests.memory,GPU:.spec.containers[*].resources.limits.nvidia\.com/gpu,NODE_SELECTOR:.spec.nodeSelector,AFFINITY:.spec.affinity.podAntiAffinity' \
                                                  >"$OUT/requests.txt" 2>&1

# Pods pinned to specific nodes or tolerating taints (block consolidation)
kubectl get pods -A -o jsonpath='{range .items[*]}{.metadata.namespace}/{.metadata.name}{"\t"}{.spec.nodeSelector}{"\t"}{.spec.tolerations}{"\n"}{end}' \
                                                  >"$OUT/selectors-tolerations.txt" 2>&1

# PV reclaim policy: Delete means data disappears with the cluster
kubectl get pv -o custom-columns='PV:.metadata.name,SIZE:.spec.capacity.storage,RECLAIM:.spec.persistentVolumeReclaimPolicy,SC:.spec.storageClassName,CLAIM:.spec.claimRef.namespace/.spec.claimRef.name' \
                                                  >"$OUT/pv-reclaim.txt" 2>&1

tar czf "$OUT.tar.gz" "$OUT" && echo "Done: $OUT.tar.gz (no Secrets are collected)"
