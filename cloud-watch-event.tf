/*
This is used to trigger the lambda function
*/
resource "aws_cloudwatch_event_rule" "bei-schedule-lambda-execution" {
  name        = "${var.cloud-wath-rule-name}"
  description = "schedule lambda execution"
  schedule_expression = "${var.cloud-watch-cron}" 
  role_arn = "${aws_lambda_function.lambda-function-rotate-keys.arn}"
}
