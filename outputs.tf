output "alb_dns" {
  value       = aws_lb.alb.dns_name
  description = "Open this in your browser: http://<value>"
}

