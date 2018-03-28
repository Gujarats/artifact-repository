resource "aws_iam_user" "developer"{
  name = "${var.iam-user-s3-reader}"
  force_destroy = true
}
