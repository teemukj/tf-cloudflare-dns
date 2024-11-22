locals {
  records = {
    # -------------------------- foobar.xyz
    "foobar.xyz" = [
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
    # -------------------------- example.com
    "example.com" = [
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
}
