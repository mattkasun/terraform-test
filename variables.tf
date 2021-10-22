################################################################################
# Required Variables. These variables have no default and you will be requried #
# to provide them.                                                             #
################################################################################

# Our DigitalOcean API token.
variable "do_token" {}

# Name of your SSH Keys as it appears in the DigitalOcean dashboard
variable "ssh_key_matt" {
  type    = string
  default = "winterfell"
}

variable "ssh_key_dillon" {
  type    = string
  default = "dillon"
}

variable "ssh_key_alex" {
  type    = string
  default = "alex"
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

