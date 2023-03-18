foobar_xyz = {
  # Example domain verification
  example-aad = {
    name  = "foobar.xyz"
    ttl   = 3600
    type  = "TXT"
    value = "MS=ms00000000"
  },
  # Example SPF record
  example-spf = {
    name  = "foobar.xyz"
    type  = "TXT"
    value = "v=spf1 include:mail.co ~all"
  }
}
