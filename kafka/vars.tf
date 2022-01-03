variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {}

variable "AMIS" {
  type = map(string)
}

variable "INSTANCE_TYPE" {}

variable "CLUSTER_SIZE"{}

variable "CLUSTER_NAME"{}

variable TAGS {}

variable "PATH_TO_PRIVATE_KEY" {}

variable "PATH_TO_PUBLIC_KEY" {}

variable "INSTANCE_USERNAME" {}
