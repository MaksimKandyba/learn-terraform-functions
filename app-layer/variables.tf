variable "ip_width" {
  description = "Number of bits for IP address"
  type        = map(string)
  default = {
    32  = "v4"
    128 = "v6"
  }
}
