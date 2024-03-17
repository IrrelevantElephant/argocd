output "k8s_cluster_id" {
  value = scaleway_k8s_cluster.cluster.id
}

output "container_registry" {
  value = scaleway_registry_namespace.main.endpoint
}