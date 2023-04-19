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
