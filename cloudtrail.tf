
resource "aws_s3_bucket" "route53_cloudtrail_logs" {

  count  = var.enable_cloudtrail_logging ? 1 : 0
  bucket = "route53-cloudtrail-logs-${var.cluster_name}"
  tags   = var.tags

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::route53-cloudtrail-logs-${var.cluster_name}"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::route53-cloudtrail-logs-${var.cluster_name}/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY
}




resource "aws_cloudtrail" "route53" {
  
  count                         = var.enable_cloudtrail_logging ? 1 : 0
  name                          = "route53-trail"
  s3_bucket_name                = aws_s3_bucket.route53_cloudtrail_logs[0].id
  s3_key_prefix                 = "trail"
  include_global_service_events = true
  is_multi_region_trail  = true
}
