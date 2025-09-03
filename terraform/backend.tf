terraform {
  backend "s3" {
    bucket         = "terraform-state-fardus"   # 👈 use the bucket name you created
    key            = "infra/terraform.tfstate"  # path inside the bucket
    region         = "eu-north-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
