terraform {
  backend "s3" {
    bucket         = "terraform-state-fardus"   
    key            = "infra/terraform.tfstate"  
    region         = "eu-north-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
