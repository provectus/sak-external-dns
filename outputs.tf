output "zone_id" {
  value = var.mainzoneid != "" ? var.mainzoneid : (var.aws_private ? aws_route53_zone.private[0].zone_id : aws_route53_zone.public[0].zone_id)
  description = "An ID of the created Route53 zone"
}
