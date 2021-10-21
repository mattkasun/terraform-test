resource "digitalocean_droplet" "server" {
  image     = var.server-image
  name      = "server"
  region    = var.region
  size      = var.droplet_size
  ssh_keys  = [data.digitalocean_ssh_key.matt.id, data.digitalocean_ssh_key.dillon.id, data.digitalocean_ssh_key.alex.id]
  tags      = ["server", "netmaker"]
  user_data = <<EOF
#cloud-config
#package_upgrade: true
#package_update: true
#package_reboot_if_required: true
#packages:
#- wireguard
#- docker.io
#- docker-compose
runcmd:
- wget -O /root/Caddyfile https://raw.githubusercontent.com/gravitl/netmaker/master/docker/Caddyfile
- sed -i "s/NETMAKER_BASE_DOMAIN/clustercat.com/g" /root/Caddyfile
- sed -i "s/YOUR_EMAIL/fake@email.com/g" /root/Caddyfile
- wget -O /root/docker-compose.yml https://raw.githubusercontent.com/gravitl/netmaker/master/compose/docker-compose.caddy.yml
- PUBLIC_IP=$(curl -s ifconfig.me)
- COREDNS_IP=$(ip route get 1 | awk '{ print $7 }')
- sed -i "s/NETMAKER_BASE_DOMAIN/clustercat.com/g" /root/docker-compose.yml
- sed -i "s/SERVER_PUBLIC_IP/$PUBLIC_IP/g" /root/docker-compose.yml
- sed -i "s/COREDNS_IP/$COREDNS_IP/g" /root/docker-compose.yml
- sed -i "s/REPLACE_MASTER_KEY/masterkey/g" /root/docker-compose.yml
- cd /root; docker-compose up -d
EOF
}

resource "digitalocean_record" "server" {
  domain = var.domain_name
  type   = "A"
  name   = "server"
  value  = digitalocean_droplet.server.ipv4_address
  ttl    = 300
}

resource "digitalocean_record" "api" {
  domain = var.domain_name
  type   = "A"
  name   = "api"
  value  = digitalocean_droplet.server.ipv4_address
  ttl    = 300
}

resource "digitalocean_record" "dashboard" {
  domain = var.domain_name
  type   = "A"
  name   = "dashboard"
  value  = digitalocean_droplet.server.ipv4_address
  ttl    = 300
}

resource "digitalocean_record" "grpc" {
  domain = var.domain_name
  type   = "A"
  name   = "grpc"
  value  = digitalocean_droplet.server.ipv4_address
  ttl    = 300
}

