module "authors_table" {
  source     = "../modules/dynamodb"
  table_name = "Authors"
  context    = module.naming.context
}

module "courses_table" {
  source     = "../modules/dynamodb"
  table_name = "Courses"
  context    = module.naming.context
}

module "lambda_api" {
  source = "../modules/lambda-api"

  function_name = format("courses-%v", module.naming.id)
  handler       = "index.handler"
  code_path     = "${path.module}/function"
  output_path   = "${path.module}/lambda_api.zip"
  context       = module.naming.context
  table_arn     = module.courses_table.table_arn

  env_var = {
    TABLE_NAME = module.courses_table.table_name
  }

  policy_file = data.template_file.crud_policy_authors.rendered
  depends_on  = [null_resource.create_lambda]
}

resource "null_resource" "create_lambda" {
  provisioner "local-exec" {
    command = "cd function && npm i && zip -r ../lambda_api.zip ."
  }
}

