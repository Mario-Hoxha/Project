output "website-url" {
  value = "http://${aws_s3_bucket.mario-website.bucket}.s3-website.${aws_s3_bucket.mario-website.region}.amazonaws.com"
}



output "bucket-name" {
  value = aws_s3_bucket.mario-website.id
}