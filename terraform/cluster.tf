module "kubernetes_cluster" {
  source = "/Users/jakoberpf/Code/jakoberpf/terraform/modules/proxmox/kubernetes-cluster"
  providers = {
    proxmox  = proxmox
    remote   = remote.proxmox
    zerotier = zerotier
  }

  id_prefix              = 20
  name                   = "athena"
  node                   = "dev"
  instance_template      = "ubuntu-focal-cloudinit"
  instance_cpus          = 4
  instance_memory        = 16384
  instance_disk_backend  = "local-zfs"
  network_ip_prefix      = "192.168.0.10"
  network_gateway        = "192.168.0.1"
  ssh_authorized_keys    = var.authorized_keys
  zerotier_network_id    = var.zerotier_network_id_development
  zerotier_ip_assignment = "10.147.19.110"
}
