provider "aws" {
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
  region = var.AWS_REGION
}


terraform {
  backend "s3"{
    bucket = "eebootcamptimesheetdev"
    key = "dev-frontend.tfstate"
    region = "us-east-1"
  }

}
