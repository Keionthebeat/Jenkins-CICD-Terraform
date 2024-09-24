resource "aws_instance" "jenkins_server" {
  ami           = "ami-0c55b159cbfafe1f0" # Change this to the appropriate AMI ID for your region
  instance_type = "t2.micro"              # Change this to a different instance type if needed
  key_name      = var.key_name            # Ensure this variable is set to your key pair name

  security_groups = [aws_security_group.jenkins_sg.name]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y java-1.8.0-openjdk
              wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
              rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
              sudo yum install -y jenkins
              sudo systemctl start jenkins
              sudo systemctl enable jenkins
              EOF

  tags = {
    Name = "JenkinsServer"                # Change this tag to a different name if needed
  }
}

resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins_sg"              # Change this name if needed
  description = "Allow SSH and Jenkins traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]             # Ensure this variable is set to your IP address
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]           # Change this to restrict access to specific IPs if needed
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]           # Change this to restrict outbound traffic if needed
  }
}

resource "aws_s3_bucket" "jenkins_artifacts" {
  bucket = "jenkins-artifacts-${var.bucket_suffix}"  # Ensure this variable is set to a unique suffix
}

resource "aws_s3_bucket_acl" "jenkins_artifacts_acl" {
  bucket = aws_s3_bucket.jenkins_artifacts.bucket
  acl    = "private"                                 # Change this to a different ACL if needed
}