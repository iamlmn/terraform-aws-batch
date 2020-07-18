#######
# IAM #
#######

resource "aws_iam_role" "aws_jd_task_role" {
  name = "${var.job_definition_name}-job-definition-taskrole"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
    {
        "Action": "sts:AssumeRole",
        "Effect": "Allow",
        "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
        }
    }
    ]
}
EOF
}

resource "aws_iam_policy" "jd-task-policy" {
  name        = "${var.job_definition_name}-task-role-policy"
  description = "Batch Job definition task role policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  
  "Statement": [
    {
      "Action": ${jsonencode(var.iam_task_policy_actions)},
      "Effect": "Allow",
      "Resource": ${jsonencode(var.iam_task_policy_resources)}


    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "aws_jd_task_role" {
  role       = "${aws_iam_role.aws_jd_task_role.name}"
  policy_arn = "${aws_iam_policy.jd-task-policy.arn}"
}

#############################
# 		Job-definitions  	    #
#############################

resource "aws_batch_job_definition" "batch-jd" {
  name                 = var.job_definition_name
  type                 = "container"
  container_properties = <<EOF
{
    "command": ${jsonencode(var.jd_command)},
    "image": "${data.aws_caller_identity.current.account_id}.dkr.ecr.us-east-1.amazonaws.com/${var.docker_ecr_link}",
    "memory": ${var.jd_memory},
    "vcpus": ${var.jd_vcpus},
    "volumes": [],
    "jobRoleArn": "${aws_iam_role.aws_jd_task_role.arn}",
    "environment": [
        {"name": "ENV", "value": "dev"}
    ],
    "mountPoints": [],
    "ulimits": []
}
EOF
}





