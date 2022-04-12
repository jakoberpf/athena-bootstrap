resource "local_file" "kubespray_inventory" {
  content  = module.kubernetes_cluster.kubespray_inventory
  filename = "${path.root}/../kubespray/inventory.ini"
}
