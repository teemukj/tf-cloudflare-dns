#
# Create resources
#

data "cloudflare_zone" "zones" {
  for_each = local.records
  name     = each.key
}

module "records" {
  for_each = local.records
  source   = "./modules/cloudflare-dns-records"

  cloudflare_zone_id   = data.cloudflare_zone.zones[each.key].id
  cloudflare_zone_name = each.key
  records              = { for idx, record in each.value : idx => record }
}
