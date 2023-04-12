terraform {
  backend "s3" {
    bucket         = "ishtvan-lab-backend"
    key            = "lab1/terraform.tfstate" 
    region         = "eu-west-1"
    dynamodb_table = "ishtvan-lab-backend-lab1"
  }
}