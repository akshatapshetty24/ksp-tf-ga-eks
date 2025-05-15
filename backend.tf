terraform {
  backend "s3" {
    bucket         = "ksp-tf-ga-eks-state-bucket"
    key            = "eks/github-actions/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "ksp-tf-ga-eks-lock-table"
    encrypt        = true
  }
}
