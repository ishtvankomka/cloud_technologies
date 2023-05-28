output "role_arn" {
  description = "Lambda Role ARM"
  value       = aws_iam_role.lambda_role.arn
}

output "role_name" {
  description = "Lambda IAM name"
  value       = aws_iam_role.lambda_role.name
}

output "invocation_arn" {
  description = "ARN to be used for invoking Lambda Function from API Gateway - to be used in aws_api_gateway_integration's uri."
  value       = aws_lambda_function.serverless-api.invoke_arn
}

output "lambda_arn" {
  description = "Amazon Resource Name (ARN) identifying your Lambda Function."
  value       = aws_lambda_function.serverless-api.invoke_arn
}
