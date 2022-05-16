#!/usr/bin/env bash

set -eo pipefail

GIT_ROOT=$(git rev-parse --show-toplevel)
cd $GIT_ROOT

# Run terraform apply
cd terraform
nodes+=$(terraform state list module.kubernetes_cluster.module.masters | grep proxmox_vm_qemu.this)
nodes+=" " # fix for wierd bug of adding new entries
nodes+=$(terraform state list module.kubernetes_cluster.module.workers | grep proxmox_vm_qemu.this)
for node in ${nodes}; do
    terraform taint ${node}
done
cd $GIT_ROOT
