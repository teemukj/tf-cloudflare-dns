locals {
  example = {
    name : "example.com"
    records : [
      {
        type  = "TXT"
        value = "verification=xxyyzz"
      },
      {
        priority = 10
        type     = "MX"
        value    = "mx1.mail.co"
      },
      {
        priority = 20
        type     = "MX"
        value    = "mx2.mail.co"
      }
    ]
  }
  # Transform records to a map
  example_records = { for index, record in local.example.records : "${index}" => record }
}


module "example" {
  source = "./modules/cloudflare-dns-records"

  cloudflare_zone_id   = data.cloudflare_zone.zones[local.example.name].id
  cloudflare_zone_name = local.example.name
  records              = local.example_records
}