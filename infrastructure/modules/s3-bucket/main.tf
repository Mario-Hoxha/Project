
### S3

resource "aws_s3_bucket" "mario-website" {
  bucket = "${var.app_name}-website"
  tags = {
    Name = "mario-website"
  }
}

resource "aws_s3_bucket_website_configuration" "web-conf" {
  bucket = aws_s3_bucket.mario-website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "public-acces" {
  bucket = aws_s3_bucket.mario-website.id
  
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "null_resource" "wait" {
  triggers = {
    # Use a trigger that changes to ensure this runs on every apply
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "sleep 60" # Sleep for 60 seconds
  }
}

resource "aws_s3_bucket_policy" "bucket-policy" {
  bucket = aws_s3_bucket.mario-website.id

   policy = <<POLICY
{
  "Id": "Policy",
  "Statement": [
    {
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::mario-website/*",
      "Principal": {
        "AWS": [
          "*"
        ]
      }
    }
  ]
}
POLICY

  depends_on = [null_resource.wait]
}