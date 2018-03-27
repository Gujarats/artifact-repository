resource "aws_iam_user" "bei-developers"{
  name = "${var.iam-user-s3-reader}"
}

resource "aws_iam_access_key" "bei-developers-key" {
  user = "${aws_iam_user.bei-developers.name}"
}
