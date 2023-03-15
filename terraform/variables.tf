# Cloudflare API token secret
variable "cloudflare_api_token" {
  description = "Cloudflare API token with necessary permissions for Terraform to manage the DNS zone records"
  type        = string
  sensitive   = true
  default     = null
}


#
# Records variable for each zone
#

# 'example.com'
variable "example_com" {
  description = "Map of record objects to create"
  type = map(object({
    name     = string
    priority = optional(number)
    proxied  = optional(string)
    ttl      = optional(number)
    type     = string
    value    = string
  }))
}

# 'foobar.xyz'
variable "foobar_xyz" {
  description = "Map of record objects to create"
  type = map(object({
    name     = string
    priority = optional(number)
    proxied  = optional(string)
    ttl      = optional(number)
    type     = string
    value    = string
  }))
}
