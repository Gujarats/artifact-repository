resource "aws_iam_role" "bei-developers-get-credentials" {
  description = "role for all developers to get the read access for s3"
  name = "bei-developers-get-credentials"
  force_detach_policies = true
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "${var.accounts[0]}",
          "${var.accounts[1]}"
        ]
      },
      "Action": "sts:AssumeRole",
      "Condition": {}
    }
  ]
}
EOF
}

resource "aws_iam_policy" "get-credentials-parameter-store" {
    name        = "GetCredentialsParameterStore"
    description = "For getting the acces & secret keys from parameter store"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ssm:GetParameters",
                "ssm:GetParameter"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "bei-developers-get-credentials-attachment" {
    role       = "${aws_iam_role.bei-developers-get-credentials.name}"
    policy_arn = "${aws_iam_policy.get-credentials-parameter-store.arn}"
}

