locals {
  image_name = var.image_name != null ? var.image_name : basename(path.cwd)
  base_path  = "${path.cwd}/Dockerfile"
}


resource "null_resource" "this_image" {

  provisioner "local-exec" {
    command = "docker build -t $NAME:$TAG $CONTEXT"
    environment = {
      NAME    = local.image_name
      TAG     = var.image_tag
      CONTEXT = var.context
    }
  }

  provisioner "local-exec" {
    command = "docker login -u $USERNAME -p $PASSWORD && docker push $NAME:$TAG"
    environment = {
      URL      = var.server_url
      USERNAME = var.username
      PASSWORD = var.password
      NAME = local.image_name
      TAG  = var.image_tag
    }
  }

  triggers = {
    file_hash  = filebase64sha256(local.base_path)
    image_name = local.image_name
    image_tag  = var.image_tag
  }
}

# provider "docker" {
#   # host = "unix:///var/run/docker.sock"
#   registry_auth {
#     address = "registry.hub.docker.com"
#     username = var.username
#     password = var.password
#   }
# }


# resource "docker_registry_image" "test" {

#   name = "freedevops/test:1.0"
  

#   build {
#     context = local.base_path
#     suppress_output = false
#   }

# }
