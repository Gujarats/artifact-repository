resource "aws_iam_user" "bei-lambda"{
  name = "${var.iam-user-lambda}"
}

resource "aws_iam_access_key" "bei-lambda-key" {
  user = "${aws_iam_user.bei-lambda.name}"
}
