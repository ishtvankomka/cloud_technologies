output "role_arn" {
  description = "Lambda Role ARM"
  value       = aws_iam_role.lambda_role.arn
}

output "role_name" {
  description = "Lambda IAM name"
  value       = aws_iam_role.lambda_role.name
}
