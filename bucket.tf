resource "aws_s3_bucket" "buckets" {
  for_each = var.buckets

  bucket = var.buckets[each.key]
}