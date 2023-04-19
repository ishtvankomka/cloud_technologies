resource "aws_iam_role" "lambda_role" {
  name               = "${var.function_name}-iam-role-lambda"
  assume_role_policy = data.aws_iam_policy_document.AWSLambdaTrustPolicy.json
}

resource "aws_iam_role_policy_attachment" "iam_role_lambda_basic_execution" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  output_path = var.output_path
  source_dir  = var.code_path
}

resource "aws_lambda_function" "serverless-api" {
  filename      = var.output_path
  function_name = var.function_name
  role          = aws_iam_role.lambda_role.arn
  handler       = var.handler
  runtime       = "nodejs16.x"

  depends_on = [
    data.archive_file.lambda_zip
  ]
}

module "labels" {
  source  = "cloudposse/label/null"
  context = var.context
}
