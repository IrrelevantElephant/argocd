provider "helm" {
  kubernetes {
    cluster_ca_certificate = base64decode(scaleway_k8s_cluster.cluster.kubeconfig[0].cluster_ca_certificate)
    host                   = scaleway_k8s_cluster.cluster.kubeconfig[0].host
    token                  = scaleway_k8s_cluster.cluster.kubeconfig[0].token
  }
}

resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true

  depends_on = [scaleway_k8s_cluster.cluster]
}
