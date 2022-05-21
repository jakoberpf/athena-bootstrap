# athena-bootstrap

This project is the first stage of the athena kubernetes cluster.

- ***athena-bootstrap***
- athena-installer
- athena-configuration

# [controller-node:vars]
# node_labels={"node-role.kubernetes.io/master":"master"}

[compute-node:vars]
node_labels={"node-role.kubernetes.io/worker":"worker"}