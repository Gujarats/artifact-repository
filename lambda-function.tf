/* In order to upload the lambda function code you need to clone this repo : 
follow this command : 

$ git clone git@github.com:Gujarats/ark.git
$ cd ark/app/lambda
$ GOOS=linux go build -o aws-rotate-keys
$ zip aws-rotate-keys.zip ./aws-rotate-keys
*/

resource "aws_lambda_function" "lambda-function-rotate-keys" {
  description = "roate the access & secret keys IAM user"
  filename         = "aws-rotate-keys.zip"
  function_name    = "${var.lambda-function-name}"
  role             = "${aws_iam_role.lambda-role.arn}"
  handler          = "aws-rotate-keys"
  source_code_hash = "${base64sha256(file("aws-rotate-keys.zip"))}"
  runtime          = "${var.lambda-runtime}"
  timeout = "${var.lambda-time-out}"
  environment {
    variables = {
      PREFIX_ENV_MINE = "MY_APP"
      MY_APP_USER = "${var.iam-user-s3-reader}"
      MY_APP_REGION = "${var.region}"
    }
  }
}
