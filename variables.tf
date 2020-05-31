variable "vm-name" {
  
}

variable "zone" {
  default = "us-central1-c"
}

variable "machine" {
  default = "f1-micro"
}

variable "tags" {
  type = string
  default = "web"
}


variable "image" {
  default = "debian-cloud/debian-9"
}

variable "image_size" {
  default = 10
}

variable "image_type" {
  default = "pd-standard"
}

variable "network" {
  default = "default"
}

variable "protocol" {
  default = "tcp"
}

variable "port" {
  default = ["80", "8080"]
}

