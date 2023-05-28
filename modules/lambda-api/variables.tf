variable "function_name" {
  description = "Lambda function's name."
}

variable "code_path" {
  description = "Function path"
}

variable "output_path" {
  description = "Zip path"
}

variable "handler" {
  description = "Function entrypoint."
}

variable "context" {
  description = "Module context"
}

variable "env_var" {
  default     = {}
  description = "Map of environment variables that are accessible from the function code during execution. If provided at least one key must be present."
  type        = map(string)
}

variable "table_arn" {
  type        = string
  description = "ARN of DynamoDB table"
}

variable "policy_file" {

}