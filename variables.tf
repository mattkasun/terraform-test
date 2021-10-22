################################################################################
# Required Variables. These variables have no default and you will be requried #
# to provide them.                                                             #
################################################################################

# Our DigitalOcean API token.
variable "do_token" {}

# Name of your SSH Keys as it appears in the DigitalOcean dashboard
variable "ssh_key_matt" {
  type    = string
  default = "4c:14:4f:5b:b3:71:c0:ef:88:d5:69:a0:6b:ec:0d:0a"
}

variable "ssh_key_dillon" {
  type    = string
  default = "59:91:ba:32:be:7b:43:8d:0e:e0:68:af:43:12:39:15"
}

variable "ssh_key_alex" {
  type    = string
  default = "38:e7:1b:a4:00:23:2f:45:4f:80:b7:ae:64:28:f2:6c"
}

# The first part of my URL. Ex: the www in www.digitalocean.com
#variable "subdomain" {
#  type    = string
#  default = "netmaker-test"
#}

# Domain you have registered and DigitalOcean manages
variable "domain_name" {
  type    = string
  default = "clustercat.com"
}

################################################################################
# Optional Variables. These have defaults set don't need to be modified for    #
# this to run. Modify them to your liking if you desire.terraform              #
################################################################################

# Name of your project. Will be prepended to most resources
variable "name" {
  type    = string
  default = "netmaker"
}
# The region to deploy our infrastructure to.
variable "region" {
  type    = string
  default = "tor1"
}


# The number of droplets to create.
variable "droplet_count" {
  type    = number
  default = 1
}

# The number of client nodes to create
variable "clients" {
  type    = number
  default = 3
}

# The size we want our droplets to be. 
# Can view slugs (valid options) https://slugs.do-api.dev/
variable "droplet_size" {
  type    = string
  default = "s-1vcpu-1gb"
}

# The operating system image we want to use. 
# Can view slugs (valid options) https://slugs.do-api.dev/
variable "client-image" {
  type    = string
  default = "ubuntu-21-04-x64"
}

variable "server-image" {
  type    = string
  default = "93527357"
}

variable "image" {
  type    = string
  default = "ubuntu-21-04-x64"
}

