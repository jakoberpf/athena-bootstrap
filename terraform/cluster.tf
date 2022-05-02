module "kubernetes_cluster" {
  source = "/Users/jakoberpf/Code/jakoberpf/terraform/modules/proxmox/kubernetes-cluster"
  providers = {
    cloudflare     = cloudflare
    proxmox        = proxmox
    remote = remote.proxmox
    remote.gateway = remote.gateway
    zerotier       = zerotier
  }

  id                    = 20
  name                  = "athena"
  node                  = "dev"
  instance_template     = "ubuntu-focal-cloudinit"
  instance_cpus         = 4
  instance_memory       = 16384
  instance_disk_backend = "local-zfs"
  network_ip_prefix     = "192.168.0.10"
  network_gateway       = "192.168.0.1"
  ssh_authorized_keys   = var.authorized_keys
  zerotier_subnet       = "10.110.180.0"
  bastion_host          = "10.147.19.60"
  bastion_user          = "root"
  cloudflare_email      = var.cloudflare_email
  cloudflare_zone_id    = var.cloudflare_zone_id
  cloudflare_token      = var.cloudflare_token
}
