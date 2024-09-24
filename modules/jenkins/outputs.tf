output "jenkins_public_ip" {
  description = "Public IP of the Jenkins server"
  value       = aws_instance.jenkins_server.public_ip
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket for Jenkins artifacts"
  value       = aws_s3_bucket.jenkins_artifacts.bucket
}