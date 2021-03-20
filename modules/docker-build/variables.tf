variable "image_name" {
  type    = string
  default = null
}

variable "image_tag" {
  type    = string
  default = "version20"
}

variable "context" {
  type    = string
  default = "."
}

variable "server_url" {
  type    = string
  default = "https://index.docker.io/v2/"
}

variable "username" {
  type      = string
  # sensitive = true
}

variable "password" {
  type      = string
  # sensitive = true
}