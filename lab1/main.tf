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
  source        = "../modules/lambda-api"
  function_name = module.naming.id
  handler       = "index.handler"
  context       = module.naming.context
  code_path     = "${path.module}/function"
  output_path   = "${path.module}/lambda_api.zip"
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = module.lambda_api.role_name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}
