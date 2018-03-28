/* In order to upload the lambda function code you need to clone this repo : 
follow this command : 

$ git clone git@github.com:Gujarats/ark.git
$ cd ark/app/lambda
$ GOOS=linux go build -o aws-rotate-keys
$ zip aws-rotate-keys.zip ./aws-rotate-keys
*/

resource "aws_lambda_function" "lambda-function-rotate-keys" {
  description = "roate the access & secret keys IAM user"
  filename         = "aws-roate-keys.zip"
  function_name    = "${var.lambda-function-name}"
  role             = "${aws_iam_role.bei-lambda-role.arn}"
  handler          = "aws-rotate-keys"
  source_code_hash = "${base64sha256(file("aws-rotate-keys.zip"))}"
  runtime          = "go1.x"
  timeout = "5"

  environment {
    variables = {
      PREFIX_ENV_MINE = "MY_APP"
      MYAPP_USER = "${var.iam-user-s3-reader}"
      MYAPP_REGION = "{var.region}"
    }
  }
}
