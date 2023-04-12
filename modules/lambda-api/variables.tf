variable "function_name" {
  type        = string
  description = "Lambda function's name."
}

variable "lambda_zip" {
  description = "Deployment package location."
}

variable "handler" {
  default     = ""
  description = "Function entrypoint."
}

variable "context" {
  description = "Module context"
}
