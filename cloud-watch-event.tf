/*
This is used to trigger the lambda function
*/
resource "aws_cloudwatch_event_rule" "schedule-lambda-execution" {
  name        = "${var.cloud-watch-rule-name}"
  description = "schedule lambda execution"
  schedule_expression = "${var.cloud-watch-cron}" 
}

resource "aws_cloudwatch_event_target" "target-schedule-lambda-execution" {
    rule = "${aws_cloudwatch_event_rule.schedule-lambda-execution.name}"
    target_id = "check-lambda-rotator"
    arn = "${aws_lambda_function.lambda-function-rotate-keys.arn}"
}

resource "aws_lambda_permission" "allow-cloudwatch-to-call-lambda-rotator" {
    statement_id = "AllowExecutionFromCloudWatch"
    action = "lambda:InvokeFunction"
    function_name = "${aws_lambda_function.lambda-function-rotate-keys.function_name}"
    principal = "events.amazonaws.com"
    source_arn = "${aws_cloudwatch_event_rule.schedule-lambda-execution.arn}"
}
