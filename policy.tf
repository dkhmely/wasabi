resource "aws_iam_policy" "ro_policy" {
  for_each = var.buckets

  name        = "${each.key}_ro_policy"
  path        = "/"
  description = "Read-only access to ${each.value}"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ],
        Resource = [
          "arn:aws:s3:::${each.value}",
          "arn:aws:s3:::${each.value}/*"
        ]
      }
    ]
  })
}

resource "aws_iam_policy" "rw_policy" {
  for_each = var.buckets

  name        = "${each.key}_rw_policy"
  path        = "/"
  description = "Read-write access to ${each.value}"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ],
        Resource = [
          "arn:aws:s3:::${each.value}",
          "arn:aws:s3:::${each.value}/*"
        ]
      }
    ]
  })
}
