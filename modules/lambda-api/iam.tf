resource "aws_iam_role_policy_attachment" "crud-policy-attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.dynamodb_crud_policy.arn
}

resource "aws_iam_policy" "dynamodb_crud_policy" {
  name        = "${var.function_name}-DynamoDBCrudPolicy"
  path        = "/"
  description = "DynamoDBCrudPolicy"
  policy      = var.policy_file
}
