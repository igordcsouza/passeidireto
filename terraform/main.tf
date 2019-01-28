provider "digitalocean" {}

resource "digitalocean_droplet" "web-app" {
  image    = "centos-7-x64"
  name     = "web-app"
  region   = "${var.default_do_droplet_region}"
  size     = "${var.default_do_droplet_size}"
  ssh_keys = "${var.default_ssh_keys}"
  tags     = ["webapp", "baseline"]
}

resource "digitalocean_droplet" "database" {
  image    = "centos-7-x64"
  name     = "database"
  tags     = ["database", "baseline"]
  region   = "${var.default_do_droplet_region}"
  size     = "${var.default_do_droplet_size}"
  ssh_keys = "${var.default_ssh_keys}"
}

resource "digitalocean_loadbalancer" "public" {
  name   = "loadbalancer-pd"
  region = "${var.default_do_droplet_region}"
  count  = 0

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = ["${digitalocean_droplet.web-app.id}"]
}