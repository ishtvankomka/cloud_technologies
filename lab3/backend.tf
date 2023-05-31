terraform {
  backend "s3" {
    profile        = "default"
    bucket         = "ishtvan-lab-backend"
    key            = "lab3/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "ishtvan-lab-backend-lab3"
  }
}
