resource "aws_s3_bucket" "single_bucket" {
    bucket = "${var.single-bucket}"
    force_destroy = true 
    versioning {
        enabled = true
    }
}
