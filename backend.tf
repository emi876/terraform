terraform {
  backend "s3" {
    bucket         = "emi-terraform-test"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "emi-dbterraform"
  }
}