variable "AWS_REGION" {
  default = "ap-southeast-3"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    ap-southeast-3 = "ami-029497464bf11fc26"
    ap-southeast-1 = "ami-0fbb51b4aa5671449"
    eu-west-1 = "ami-04e2e94de097d3986"
  }
}

variable "INSTANCE_TYPE" {
  default = "t3.medium"
}

variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}

variable "INSTANCE_DEVICE_ID" {
  default = "/dev/nvme1n1"
}