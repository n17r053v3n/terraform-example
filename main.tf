terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}

provider "docker" {
  host = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}


resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = var.container_name
  ports {
    internal = 80
    external = 8080
  }
  ports {
    internal = 22
    external = 2222
  }
  #   provisioner "file" {
  #   source = "C:/Users/n17r0/Desktop/TOGO-newDisk/Code/wba2-janousek-jiri-2k/ukoly/pololetni-prace/"
  #   destination = "/usr/share/nginx/html"
  #   }
}
