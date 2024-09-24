variable "key_name" {
  description = "The name of the key pair to use for the instance"
  type        = string
}

variable "my_ip" {
  description = "Your IP address to allow SSH access"
  type        = string
}

variable "bucket_suffix" {
  description = "A unique suffix for the S3 bucket name"
  type        = string
}