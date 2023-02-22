variable "image-id" {
    description = "Image ID of ubuntu 20.04LTS"
    default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}

variable "instance-type" {
    description = "Small Sized Compute Instance type"
    default     = "e2-micro"
}