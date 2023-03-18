variable "name" {
  description = "Name of the record"
  type        = string
}

variable "priority" {
  description = "Priority of record (MX)"
  type        = number
  default     = null
}

variable "proxied" {
  description = "value"
  type        = string
  default     = false
}

variable "ttl" {
  description = "TTL of the record (1 = Automatic)"
  type        = number
  default     = 1
}

variable "type" {
  description = "Type of the record"
  type        = string
}

variable "value" {
  description = "Value of the record"
  type        = string
}

variable "zone_id" {
  description = "Cloudflare DNS zone ID where the record will be created"
  type        = string
}
