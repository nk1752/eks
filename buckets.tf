resource "random_string" "bucket_UUID" {
  length  = 8
  special = false
}


module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "nk-s3-bucket-${lower(random_string.bucket_UUID.result)}"
  acl    = "private"

  force_destroy = true

  versioning = {
    enabled = true
  }

}
