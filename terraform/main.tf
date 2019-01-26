provider "digitalocean" {
}

resource "digitalocean_droplet" "web-app" {
 image  = "centos-7-x64"
 name   = "web-app"
 region = "${var.default_do_droplet_region}"
 size   = "${var.default_do_droplet_size}"
}

resource "digitalocean_droplet" "database" {
 image  = "centos-7-x64"
 name   = "database"
 region = "${var.default_do_droplet_region}"
 size   = "${var.default_do_droplet_size}"
}

resource "digitalocean_loadbalancer" "public" {
  name = "loadbalancer-pd"
  region = "${var.default_do_droplet_region}"

  forwarding_rule {
    entry_port = 80
    entry_protocol = "http"
    
    target_port = 80
    target_protocol = "http"
  }

  healthcheck {
    port = 22
    protocol = "tcp"
  }

  droplet_ids = ["${digitalocean_droplet.web-app.id}"]
}
