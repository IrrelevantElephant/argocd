resource "scaleway_k8s_cluster" "cluster" {
  name                        = "k8s-cluster-${local.project_name}"
  version                     = "1.28.2"
  cni                         = "cilium"
  description                 = "Private Kubernetes Cluster"
  delete_additional_resources = true
  private_network_id          = scaleway_vpc_private_network.private_network.id
  type                        = "kapsule"
}

resource "scaleway_k8s_pool" "default" {
  cluster_id  = scaleway_k8s_cluster.cluster.id
  name        = "default"
  node_type   = "PLAY2-MICRO"
  size        = 3
  autohealing = true
}
