variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {}

variable "AMIS" {
  type = map(string)
}

variable "vpc_security_group_ids" {}

variable "subnet_id" {}

variable "ENV" {}

variable "INSTANCE_TYPE" {}

variable "CLUSTER_SIZE"{}

variable "CLUSTER_NAME"{}

variable "TAGS" {
}

variable "PATH_TO_PRIVATE_KEY" {}

variable "PATH_TO_PUBLIC_KEY" {}

variable "KEY_NAME" {}

variable "INSTANCE_USERNAME" {}
