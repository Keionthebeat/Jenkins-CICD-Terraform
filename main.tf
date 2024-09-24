provider "aws" {
  region = "us-west-2"         # Change this to the region of your choice
}

module "jenkins" {             # Change this to the name of your choice
  source = "./modules/jenkins" # Change this to the path of your choice
  key_name = var.key_name
  my_ip = var.my_ip
  bucket_suffix = var.bucket_suffix
}