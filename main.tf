provider "aws" {
  region = "us-east-1"
}
resource "aws_iam_user" "this" {
  name = "this"
  path = "/"
  force_destroy = true
  tags = {
    # tag-key = "tag-value"
  }
}
resource "aws_iam_user_login_profile" "this" {
  user    = aws_iam_user.this.name
  pgp_key = var.pgp_key
  password_length         = "20"
  password_reset_required = true
  lifecycle {
    ignore_changes = [password_reset_required]
  }
}
resource "aws_iam_access_key" "this" {
  user    = aws_iam_user.this.name
  pgp_key = var.pgp_key
  status  = var.iam_access_key_status
}
resource "aws_iam_user_policy" "this_policy" {
  name = "test"
  user = aws_iam_user.this.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
EOF
}