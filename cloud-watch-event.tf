/*
This is used to trigger the lambda function
*/
resource "aws_cloudwatch_event_rule" "schedule-lambda-execution" {
  name        = "${var.cloud-watch-rule-name}"
  description = "schedule lambda execution"
  schedule_expression = "${var.cloud-watch-cron}" 
  role_arn = "${aws_lambda_function.lambda-function-rotate-keys.arn}"
}
