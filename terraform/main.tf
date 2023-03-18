#
# Define locals
#

locals {

  # Global prefix to insert for every record name (for verifying purposes)
  record_name_prefix = ""

  # Map of Cloudflare DNS zones to be managed
  cloudflare_zones = {
    "example_com" = "example.com"
    "foobar_xyz"  = "foobar.xyz"
  }
}


#
# Fetch IDs of (pre-created) zones
#

data "cloudflare_zone" "zone" {
  for_each = local.cloudflare_zones
  name     = each.value
}


#
# Create zone records
#

# 'example.com'
module "example_com" {
  for_each = var.example_com
  source   = "./modules/cloudflare-records"

  name     = "${local.record_name_prefix}${each.value.name}"
  priority = each.value.priority
  proxied  = each.value.proxied
  ttl      = each.value.ttl
  type     = each.value.type
  value    = each.value.value
  zone_id  = data.cloudflare_zone.zone["example_com"].id
}

# 'foobar.xyz'
module "foobar_xyz" {
  for_each = var.foobar_xyz
  source   = "./modules/cloudflare-records"

  name     = "${local.record_name_prefix}${each.value.name}"
  priority = each.value.priority
  proxied  = each.value.proxied
  ttl      = each.value.ttl
  type     = each.value.type
  value    = each.value.value
  zone_id  = data.cloudflare_zone.zone["foobar_xyz"].id
}