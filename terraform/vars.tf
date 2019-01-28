variable "default_do_droplet_size" {
  type    = "string"
  default = "512mb"
}

variable "default_do_droplet_region" {
  type    = "string"
  default = "nyc3"
}

variable "default_ssh_keys" {
  default = [
    "03:ab:e2:80:df:60:bb:fa:9a:b9:b5:9b:63:ef:0a:20",
    "a3:01:cb:28:cc:95:e4:eb:7c:dc:f2:79:16:7c:7c:b2",
  ]
}
