#!/usr/bin/env bash

set -eo pipefail

GIT_ROOT=$(git rev-parse --show-toplevel)
cd $GIT_ROOT

secs=$((2 * 1))
while [ $secs -gt 0 ]; do
   echo -ne "Waiting $secs\033[0K for VMs to be ready\r"
   sleep 1
   : $((secs--))
done

# Run kubespray deployment
docker run --rm -it \
  --mount type=bind,source="$GIT_ROOT"/kubespray,dst=/inventory \
  --mount type=bind,source="$GIT_ROOT"/.ssh/automation,dst=/root/.ssh/id_rsa \
  quay.io/kubespray/kubespray:v2.18.1 bash -c "ansible-playbook -i /inventory/inventory.ini -b --private-key /root/.ssh/id_rsa cluster.yml" || exit 1

# Push kubernetes admin config to vault
config_file="kubespray/artifacts/admin.conf"
yq -i '.clusters[0].cluster.server = "https://api.athena.k8s.erpf.de:6443"' $config_file
yq -i '.clusters[0].name = "erpf-athena-live"' $config_file
yq -i '.contexts[0].context.cluster = "erpf-athena-live"' $config_file
yq -i '.contexts[0].context.user = "admin"' $config_file
yq -i '.contexts[0].name = "erpf-athena-live"' $config_file
yq -i '.current-context = "erpf-athena-live"' $config_file
yq -i '.users[0].name = "admin"' $config_file
admin_conf="$(cat $config_file | base64)"
vault kv put CICD/repo/athena-bootstrap/live/kube-secret admin_conf=$admin_conf