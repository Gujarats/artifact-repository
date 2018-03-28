resource "aws_iam_user" "developer"{
  name = "${var.iam-user-s3-reader}"
}

resource "aws_iam_access_key" "developers-key" {
  user = "${aws_iam_user.developer.name}"
}
