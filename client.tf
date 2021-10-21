resource "digitalocean_droplet" "client" {
  image     = var.image
  name      = "client"
  region    = var.region
  size      = var.droplet_size
  ssh_keys  = [data.digitalocean_ssh_key.matt.id, data.digitalocean_ssh_key.dillon.id, data.digitalocean_ssh_key.alex.id]
  tags      = ["${var.name}-client", "netmaker"]
  user_data = <<EOF
#cloud-config
#package_upgrade: true
#package_update: true
#package_reboot_if_required: true
packages:
- wireguard
runcmd:
- cd /root; wget "https://github.com/gravitl/netmaker/releases/download/latest/netclient"; chmod +x netclient
EOF
}

resource "digitalocean_record" "client" {
  domain = var.domain_name
  type   = "A"
  name   = "client"
  value  = digitalocean_droplet.client.ipv4_address
  ttl    = 300
}
