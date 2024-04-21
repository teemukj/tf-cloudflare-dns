locals {
  foobar = {
    name : "foobar.xyz"
    records : [
      {
        ttl   = 3600
        type  = "TXT"
        value = "MS=ms00000000"
      },
      {
        type  = "TXT"
        value = "v=spf1 include:mail.co ~all"
      }
    ]
  }
  # Transform records to a map
  foobar_records = { for index, record in local.foobar.records : "${index}" => record }
}


module "foobar" {
  source = "./modules/cloudflare-dns-records"

  cloudflare_zone_id   = data.cloudflare_zone.zones[local.foobar.name].id
  cloudflare_zone_name = local.foobar.name
  records              = local.foobar_records
}