output "jenkins_url" {
  description = "URL to access Jenkins"
  value       = "http://${module.jenkins.jenkins_public_ip}:8080"
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket for Jenkins artifacts"
  value       = module.jenkins.s3_bucket_name
}