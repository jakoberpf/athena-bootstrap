#!/usr/bin/env bash

set -eo pipefail

GIT_ROOT=$(git rev-parse --show-toplevel)
cd $GIT_ROOT

stage="dev"

yq e "(.supplementary_addresses_in_ssl_keys[0]|=\"${stage}.athena.k8s.erpf.de\"" -i kubespray/group_vars/k8s_cluster/k8s-cluster.yml
yq e "(.supplementary_addresses_in_ssl_keys[1]|=\"api.${stage}.athena.k8s.erpf.de\"" -i kubespray/group_vars/k8s_cluster/k8s-cluster.yml
