################## Explicit Dependancy############################
## Demo to show that if the depends_on argument does not exist, the two resources EC2 and S3 bucket will be created in parallel. 
## If we add the depends_on statement, you will see that S3 starts and completes before the EC2 instance creation starts.



provider "aws" {
  region  = "us-east-1"
  profile = "default" # Profile name on your local computer to e use by Terraform.
}

resource "aws_instance" "example_ec2" {
  ami           = "ami-07ff62358b87c7116" # You must ensure the AMI is valid on your Region, check the value on AWS.
  instance_type = "t2.micro"
  depends_on    = [aws_s3_bucket.example] # This is the Explicit Dependency that creates the S3 bucket 1st then the EC2 instance.
  tags = {
    Name = "EC2-Name" # This is the name for EC2
  }
}
resource "aws_s3_bucket" "example" {
  bucket = "name-of-the-bucket-1009999" # S3 bucket name.
}




