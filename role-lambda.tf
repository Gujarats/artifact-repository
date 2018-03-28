resource "aws_iam_role" "bei-lambda-role" {
  description = "role for lambda function to ratoate access & secret keys"
  name = "${var.bei-lambda-role-name}"
  force_detach_policies = true
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Policy 
resource "aws_iam_policy" "store-credentials-policy" {
    name        = "${var.store-credentials-policy-name}"
    description = "For storing the acces & secret keys to parameter store"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "StoreCredentials",
            "Effect": "Allow",
            "Action": [
                "ssm:PutParameter",
                "ssm:DescribeParameters",
                "ssm:GetParameter"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}
resource "aws_iam_role_policy_attachment" "bei-lambda-attachment1" {
    role       = "${aws_iam_role.bei-lambda-role.name}"
    policy_arn = "${aws_iam_policy.store-credentials-policy.arn}"
}

# Policy 
resource "aws_iam_policy" "rotate-keys-policy" {
    name        = "RotateKeys"
    description = "For storing the acces & secret keys to parameter store"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "StoreCredentials",
            "Effect": "Allow",
            "Action": [
                "ssm:PutParameter",
                "ssm:DescribeParameters",
                "ssm:GetParameter"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}
resource "aws_iam_role_policy_attachment" "bei-lambda-attachment2" {
    role       = "${aws_iam_role.bei-lambda-role.name}"
    policy_arn = "${aws_iam_policy.rotate-keys-policy.arn}"
}
