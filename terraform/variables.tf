# Cloudflare API token secret
variable "cloudflare_api_token" {
  description = "Cloudflare API token with necessary permissions for Terraform to manage the DNS zone records"
  type        = string
  sensitive   = true
  default     = null
}
