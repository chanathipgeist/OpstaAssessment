# Solution

## Writing your solution here
1. Terraform init/apply to create Cluster before start lab
    - terraform init
    - terraform apply -auto-approve
2. Add
       env {
            name  = "BACKEND_API_URL"
            value = "http://backend:30951" 
          }
    in frontend.tf for connect frontend and backend
3. Add
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
    in backend.tf  for set environment to connect database
4. Delete both of front and back pods to recreate to worker3
   - kubectl delete pods -l app=frontend
   - kubectl delete pods -l app=backend
5. Delete traint in worker node 1 and 2 and add traint in worker node 3 cause you want to recreate at worker node 3
6. terraform apply -auto-approve
7. try to delete pods
   - kubectl delete pods -l app=frontend
   - kubectl delete pods -l app=backend
8. Kubernetes will be rereate pod at worker3 node 