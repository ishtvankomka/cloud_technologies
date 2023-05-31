module "s3_frontend" {
  source      = "../modules/frontend"
  context     = module.naming.context
  folder_path = "api-users-mutable-table/build"
  files       = fileset(path.module, "/api-users-mutable-table/build/**")
  depends_on  = [null_resource.frontend_build]
}

resource "null_resource" "frontend_build" {
  provisioner "local-exec" {
    command = "cd api-users-mutable-table && npm i && npm run build"
  }
}
