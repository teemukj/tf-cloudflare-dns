# Define locals
locals {
  cloudflare_managed_zones = [
    "foobar.xyz",
    "example.com"
  ]
}

data "cloudflare_zone" "zones" {
  for_each = toset(local.cloudflare_managed_zones)
  name     = each.key
}
