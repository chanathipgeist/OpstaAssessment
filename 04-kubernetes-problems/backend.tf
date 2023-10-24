resource "kubernetes_deployment" "backend" {
  metadata {
    name = "backend"
    labels = {
      app = "backend"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "backend"
      }
    }

    template {
      metadata {
        labels = {
          app = "backend"
        }
      }

      spec {
        container {
          image = "pepodev/opsta-interview-backend-example:latest"
          name  = "backend"

          liveness_probe {
            http_get {
              path = "/nginx_status"
              port = 80

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }

          port {
            container_port = 3000
          }
          env {
            name  = "DB_HOST"
            value = "mysql" 
          }
          env {
            name  = "DB_PORT"
            value = "3307" 
          }
          env {
            name  = "DB_USER"
            value = "root" 
          }
          env {
            name  = "DB_PASSWORD"
            value = "password" 
          }
          env {
            name  = "DB_NAME"
            value = "app" 
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "backend" {
  metadata {
    name = "backend"
  }
  spec {
    selector = {
      app = kubernetes_deployment.backend.metadata.0.labels.app
    }
    port {
      name        = "http"
      node_port   = 30951
      target_port = 3000
      port        = 3000
    }
    type = "NodePort"
  }
}
