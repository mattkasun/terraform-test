data "digitalocean_ssh_key" "matt" {
  name = var.ssh_key_matt
}

data "digitalocean_ssh_key" "dillon" {
  name = var.ssh_key_dillon
}

data "digitalocean_ssh_key" "alex" {
  name = var.ssh_key_alex
}

data "digitalocean_domain" "web" {
  name = var.domain_name
}
