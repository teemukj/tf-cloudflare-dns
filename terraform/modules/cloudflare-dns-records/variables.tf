variable "records" {
  type        = map(any)
  description = "Map of DNS records to create"
}

variable "cloudflare_zone_id" {
  type        = string
  description = "Cloudflare DNS zone id"
}

variable "cloudflare_zone_name" {
  type        = string
  description = "Cloudflare DNS zone name"
}

variable "name_prefix" {
  type        = string
  description = "Optional helper string for migrating records"
  default     = ""
}
